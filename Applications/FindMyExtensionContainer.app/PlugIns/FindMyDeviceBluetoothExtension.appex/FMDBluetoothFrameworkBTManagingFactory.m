@interface FMDBluetoothFrameworkBTManagingFactory
+ (BOOL)isAutomationActive;
+ (id)bluetoothManagerWithQueue:(id)a3 delegate:(id)a4;
@end

@implementation FMDBluetoothFrameworkBTManagingFactory

+ (BOOL)isAutomationActive
{
  if (qword_10002D7F0 != -1) {
    dispatch_once(&qword_10002D7F0, &stru_100021480);
  }
  v2 = sub_100006668();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_10002D7E8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAutomationBluetoothManager: isAutomationActive: %d", (uint8_t *)v4, 8u);
  }

  return byte_10002D7E8;
}

+ (id)bluetoothManagerWithQueue:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[FMDBluetoothFrameworkBTManagingFactory isAutomationActive])
  {
    if (qword_10002D808 != -1) {
      dispatch_once(&qword_10002D808, &stru_1000214C8);
    }
    [(id)qword_10002D800 setBluetoothManager:v6];
    id v7 = (id)qword_10002D800;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009438;
    block[3] = &unk_1000214A8;
    id v10 = v5;
    if (qword_10002D7F8 != -1) {
      dispatch_once(&qword_10002D7F8, block);
    }
    id v7 = +[BluetoothManager sharedInstance];
  }

  return v7;
}

@end