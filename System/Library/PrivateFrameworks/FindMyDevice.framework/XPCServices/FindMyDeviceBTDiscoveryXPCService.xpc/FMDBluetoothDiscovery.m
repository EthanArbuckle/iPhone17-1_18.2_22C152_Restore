@interface FMDBluetoothDiscovery
- (BOOL)_isDiscoveryActive;
- (FMDBluetoothDiscovery)init;
- (FMDSFDeviceDiscovery)deviceDiscovery;
- (NSMutableDictionary)devicesByIdentifier;
- (id)didDiscoverDevice;
- (id)didEndDiscovery;
- (id)didLoseDevice;
- (id)discoveredDevices;
- (void)dealloc;
- (void)finishDiscoveringWithError:(id)a3;
- (void)processDeviceInformation:(id)a3 lost:(BOOL)a4;
- (void)setDeviceDiscovery:(id)a3;
- (void)setDevicesByIdentifier:(id)a3;
- (void)setDidDiscoverDevice:(id)a3;
- (void)setDidEndDiscovery:(id)a3;
- (void)setDidLoseDevice:(id)a3;
- (void)startBLEDiscovery;
- (void)startDiscovery;
- (void)stopBLEDiscovery;
- (void)stopDiscovery;
@end

@implementation FMDBluetoothDiscovery

- (FMDBluetoothDiscovery)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDBluetoothDiscovery;
  v2 = [(FMDBluetoothDiscovery *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableDictionary dictionary];
    [(FMDBluetoothDiscovery *)v2 setDevicesByIdentifier:v3];
  }
  return v2;
}

- (void)dealloc
{
  [(FMDBluetoothDiscovery *)self stopBLEDiscovery];
  [(FMDBluetoothDiscovery *)self finishDiscoveringWithError:0];
  v3.receiver = self;
  v3.super_class = (Class)FMDBluetoothDiscovery;
  [(FMDBluetoothDiscovery *)&v3 dealloc];
}

- (BOOL)_isDiscoveryActive
{
  v2 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)discoveredDevices
{
  v2 = [(FMDBluetoothDiscovery *)self devicesByIdentifier];
  BOOL v3 = [v2 allValues];

  return v3;
}

- (void)startDiscovery
{
}

- (void)stopDiscovery
{
  if ([(FMDBluetoothDiscovery *)self _isDiscoveryActive])
  {
    [(FMDBluetoothDiscovery *)self stopBLEDiscovery];
    [(FMDBluetoothDiscovery *)self finishDiscoveringWithError:0];
  }
}

- (void)startBLEDiscovery
{
  BOOL v3 = [(FMDBluetoothDiscovery *)self deviceDiscovery];

  v4 = sub_100004888();
  objc_super v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100007574();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery starting BLE Scanning", (uint8_t *)buf, 2u);
    }

    v6 = +[FMDSFDeviceDiscoveryFactory deviceDiscovery];
    [(FMDBluetoothDiscovery *)self setDeviceDiscovery:v6];

    v7 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
    [v7 setChangeFlags:1];

    v8 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
    [v8 setDiscoveryFlags:2];

    v9 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
    [v9 setRssiThreshold:-120];

    v10 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
    [v10 setScanRate:20];

    v11 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
    [v11 setOverrideScreenOff:1];

    objc_initWeak(buf, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100006A4C;
    v22[3] = &unk_10000CEB8;
    objc_copyWeak(&v23, buf);
    v12 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
    [v12 setDeviceFoundHandler:v22];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100006AC4;
    v20[3] = &unk_10000CEE0;
    objc_copyWeak(&v21, buf);
    v13 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
    [v13 setDeviceChangedHandler:v20];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100006B3C;
    v18[3] = &unk_10000CEB8;
    objc_copyWeak(&v19, buf);
    v14 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
    [v14 setDeviceLostHandler:v18];

    v15 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100006BB4;
    v16[3] = &unk_10000C448;
    objc_copyWeak(&v17, buf);
    [v15 activateWithCompletion:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(buf);
  }
}

- (void)stopBLEDiscovery
{
  BOOL v3 = sub_100004888();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000076F0();
  }

  v4 = [(FMDBluetoothDiscovery *)self deviceDiscovery];
  [v4 invalidate];

  [(FMDBluetoothDiscovery *)self setDeviceDiscovery:0];
  objc_super v5 = [(FMDBluetoothDiscovery *)self devicesByIdentifier];
  id v6 = [v5 copy];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006D6C;
  v8[3] = &unk_10000CF08;
  v8[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
  v7 = [(FMDBluetoothDiscovery *)self devicesByIdentifier];
  [v7 removeAllObjects];
}

- (void)finishDiscoveringWithError:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(FMDBluetoothDiscovery *)self didEndDiscovery];
  objc_super v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (void)processDeviceInformation:(id)a3 lost:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(FMDBluetoothDiscovery *)self _isDiscoveryActive])
  {
    v8 = [v6 bleDevice];
    v9 = [v8 bluetoothAddress];
    v10 = objc_msgSend(v9, "fm_MACAddressString");

    if (!v10)
    {
      sub_100004888();
      v11 = (FMDBLEBeaconIdentifier *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery failed to get bluetooth address.", buf, 2u);
      }
      goto LABEL_39;
    }
    v11 = [[FMDBLEBeaconIdentifier alloc] initWithBLEDevice:v8 other:0];
    unsigned __int8 v12 = [(FMDBLEBeaconIdentifier *)v11 isValid];
    v13 = sub_100004888();
    uint64_t v14 = (uint64_t)v13;
    if ((v12 & 1) == 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_10000778C();
      }
      goto LABEL_38;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v8 bluetoothAddress];
      v16 = [v8 advertisementFields];
      *(_DWORD *)buf = 138413058;
      v40 = v15;
      __int16 v41 = 2112;
      v42 = v11;
      __int16 v43 = 2112;
      v44 = v16;
      __int16 v45 = 2048;
      id v46 = [v8 rssi];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery : %@ %@ %@ %li", buf, 0x2Au);
    }
    id v17 = sub_100004888();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery lost beacon", buf, 2u);
      }

      id v19 = [(FMDBluetoothDiscovery *)self devicesByIdentifier];
      [v19 removeObjectForKey:v11];

      v20 = [(FMDBluetoothDiscovery *)self didLoseDevice];

      if (!v20) {
        goto LABEL_39;
      }
      id v21 = sub_100004888();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery updating the callee with lost btle beacons", buf, 2u);
      }

      uint64_t v14 = [(FMDBluetoothDiscovery *)self didLoseDevice];
      (*(void (**)(uint64_t, NSObject *))(v14 + 16))(v14, v8);
    }
    else
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery found change in beacon", buf, 2u);
      }

      v22 = [(FMDBluetoothDiscovery *)self devicesByIdentifier];
      uint64_t v14 = [v22 objectForKeyedSubscript:v11];

      if (v14)
      {
        id v23 = [v8 rssi];
        v24 = [(id)v14 rssi];
        if (v23 - v24 >= 0) {
          unint64_t v25 = v23 - v24;
        }
        else {
          unint64_t v25 = v24 - v23;
        }
        v26 = sub_100004888();
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if (v25 < 0x15)
        {
          if (v27)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery checking change in advertisement packet", buf, 2u);
          }

          v28 = [v8 advertisementFields];
          v29 = [v28 objectForKeyedSubscript:@"hsStatus"];
          unsigned int v38 = [v29 unsignedIntValue];

          v30 = [(id)v14 advertisementFields];
          v31 = [v30 objectForKeyedSubscript:@"hsStatus"];
          unsigned int v32 = [v31 unsignedIntValue];

          if (v38 == v32) {
            goto LABEL_38;
          }
        }
        else
        {
          if (v27)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery found rssi change was significant", buf, 2u);
          }
        }
      }
      v33 = sub_100004888();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        sub_100007758();
      }

      v34 = [(FMDBluetoothDiscovery *)self devicesByIdentifier];
      [v34 setObject:v8 forKeyedSubscript:v11];

      v35 = [(FMDBluetoothDiscovery *)self didDiscoverDevice];

      if (v35)
      {
        v36 = sub_100004888();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery updating the callee with btle beacons", buf, 2u);
        }

        v37 = [(FMDBluetoothDiscovery *)self didDiscoverDevice];
        ((void (**)(void, NSObject *))v37)[2](v37, v8);
      }
    }
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  v8 = sub_100004888();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery is no longer active. Ignoring device.", buf, 2u);
  }
LABEL_40:
}

- (id)didEndDiscovery
{
  return self->_didEndDiscovery;
}

- (void)setDidEndDiscovery:(id)a3
{
}

- (id)didDiscoverDevice
{
  return self->_didDiscoverDevice;
}

- (void)setDidDiscoverDevice:(id)a3
{
}

- (id)didLoseDevice
{
  return self->_didLoseDevice;
}

- (void)setDidLoseDevice:(id)a3
{
}

- (FMDSFDeviceDiscovery)deviceDiscovery
{
  return self->_deviceDiscovery;
}

- (void)setDeviceDiscovery:(id)a3
{
}

- (NSMutableDictionary)devicesByIdentifier
{
  return self->_devicesByIdentifier;
}

- (void)setDevicesByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesByIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong(&self->_didLoseDevice, 0);
  objc_storeStrong(&self->_didDiscoverDevice, 0);

  objc_storeStrong(&self->_didEndDiscovery, 0);
}

@end