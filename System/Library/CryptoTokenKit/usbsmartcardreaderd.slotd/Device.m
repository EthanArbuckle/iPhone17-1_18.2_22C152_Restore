@interface Device
+ (NSMutableDictionary)devices;
+ (Synchronize)synchronize;
+ (void)registerService:(id)a3;
- (CCIDDescriptorView)CCIDDescriptor;
- (Device)initWithService:(id)a3;
- (IOUSBHostInterface)interface;
- (NSNumber)locationId;
- (NSNumber)productId;
- (NSNumber)vendorId;
- (NSString)interfaceName;
- (NSString)productName;
- (NSString)vendorName;
- (Synchronize)interruptionSync;
- (id)description;
- (id)deviceAccessBlock:(id)a3;
- (unint64_t)entryID;
- (unint64_t)handleEANotification;
- (unsigned)messageSequenceNumber;
- (void)terminate;
- (void)watchInterruptPipe:(id)a3;
@end

@implementation Device

+ (NSMutableDictionary)devices
{
  if (qword_10002C2C8 != -1) {
    dispatch_once(&qword_10002C2C8, &stru_1000248A0);
  }
  v2 = (void *)qword_10002C2C0;

  return (NSMutableDictionary *)v2;
}

+ (Synchronize)synchronize
{
  if (qword_10002C2D8 != -1) {
    dispatch_once(&qword_10002C2D8, &stru_1000248C0);
  }
  v2 = (void *)qword_10002C2D0;

  return (Synchronize *)v2;
}

- (CCIDDescriptorView)CCIDDescriptor
{
  return self->_CCIDDescriptor;
}

- (NSString)productName
{
  v3 = [(IOUSBHostInterface *)self->_interface properties];
  v4 = [v3 get:@"kUSBProductString"];

  if (!v4)
  {
    v5 = [(IOUSBHostInterface *)self->_interface properties];
    v4 = [v5 get:@"USB Product Name"];

    if (!v4)
    {
      v6 = [(Device *)self productId];
      v4 = [v6 stringValue];
    }
  }

  return (NSString *)v4;
}

- (NSString)vendorName
{
  v3 = [(IOUSBHostInterface *)self->_interface properties];
  v4 = [v3 get:@"kUSBVendorString"];

  if (!v4)
  {
    v5 = [(IOUSBHostInterface *)self->_interface properties];
    v4 = [v5 get:@"USB Vendor Name"];

    if (!v4)
    {
      v6 = [(Device *)self vendorId];
      v4 = [v6 stringValue];
    }
  }

  return (NSString *)v4;
}

- (NSString)interfaceName
{
  v2 = [(IOUSBHostInterface *)self->_interface properties];
  v3 = [v2 get:@"kUSBString"];

  return (NSString *)v3;
}

- (NSNumber)productId
{
  v2 = [(IOUSBHostInterface *)self->_interface properties];
  v3 = [v2 get:@"idProduct"];

  return (NSNumber *)v3;
}

- (NSNumber)vendorId
{
  v2 = [(IOUSBHostInterface *)self->_interface properties];
  v3 = [v2 get:@"idVendor"];

  return (NSNumber *)v3;
}

- (NSNumber)locationId
{
  v2 = [(IOUSBHostInterface *)self->_interface properties];
  v3 = [v2 get:@"locationID"];

  return (NSNumber *)v3;
}

- (unsigned)messageSequenceNumber
{
  return atomic_fetch_add_explicit((atomic_uchar *volatile)&self->_messageSequenceNumber, 1u, memory_order_relaxed);
}

- (id)description
{
  v3 = +[NSMutableString string];
  [v3 appendString:@"{\n"];
  v4 = [(Device *)self productName];
  [v3 appendFormat:@"    productName: %@\n", v4];

  v5 = [(Device *)self interfaceName];

  if (v5)
  {
    v6 = [(Device *)self interfaceName];
    [v3 appendFormat:@"    interfaceName: %@\n\n", v6];
  }
  v7 = [(Device *)self vendorName];
  [v3 appendFormat:@"    vendorName: %@\n", v7];

  v8 = [(Device *)self productId];
  [v3 appendFormat:@"    productId: %@\n", v8];

  v9 = [(Device *)self vendorId];
  [v3 appendFormat:@"    vendorId: %@\n}", v9];

  return v3;
}

- (IOUSBHostInterface)interface
{
  return self->_interface;
}

- (void)terminate
{
  v3 = sub_10000F564();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Device terminate", buf, 2u);
  }

  if (self->_notificationDispatchToken)
  {
    v4 = sub_10000F564();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100018F28();
    }

    notify_cancel(self->_notificationDispatchToken);
    self->_notificationDispatchToken = 0;
  }
  if (self->_notificationToken)
  {
    v5 = sub_10000F564();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100018EF4();
    }

    notify_cancel(self->_notificationToken);
    self->_notificationToken = 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v6 = self->_slots;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * (void)v10) terminate];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v8);
  }

  v11 = sub_10000F564();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100018EC0();
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = [(IOUSBHostInterface *)self->_interface pipes];
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) abortWithOption:1 error:0];
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v14);
  }

  v17 = +[Device devices];
  v18 = +[NSNumber numberWithUnsignedLongLong:[(Device *)self entryID]];
  [v17 removeObjectForKey:v18];
}

- (unint64_t)handleEANotification
{
  if (notify_register_check("com.apple.accessories.ea.sessionStatusChanged", &self->_notificationToken))
  {
    v3 = sub_10000F564();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100018F5C();
    }

    return 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100010770;
    v12[3] = &unk_1000248E8;
    v12[4] = self;
    v5 = objc_retainBlock(v12);
    unint64_t v4 = ((uint64_t (*)(void))v5[2])();
    if (!v4)
    {
      v6 = +[Device synchronize];
      id v7 = [v6 queue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100010810;
      v9[3] = &unk_100024910;
      v10 = v5;
      objc_copyWeak(&v11, &location);
      notify_register_dispatch("com.apple.accessories.ea.sessionStatusChanged", &self->_notificationDispatchToken, v7, v9);

      objc_destroyWeak(&v11);
    }

    objc_destroyWeak(&location);
  }
  return v4;
}

- (Device)initWithService:(id)a3
{
  id v83 = a3;
  v95.receiver = self;
  v95.super_class = (Class)Device;
  v5 = [(Device *)&v95 init];
  val = v5;
  if (!v5) {
    goto LABEL_97;
  }
  *(void *)&v5->_notificationToken = 0;
  v6 = [[Synchronize alloc] initWithQueueName:@"com.apple.ctk.ccid.interruption"];
  interruptionSync = val->_interruptionSync;
  val->_interruptionSync = v6;

  v78 = [[Properties alloc] initWithService:v83];
  v77 = [(Properties *)v78 get:@"idProduct"];
  v76 = [(Properties *)v78 get:@"idVendor"];
  id v8 = sub_10000F564();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100019224(v77, v76);
  }

  AnalyticsSendEventLazy();
  val->_entryID = sub_100003F10(v83);
  objc_initWeak(&location, val);
  id v9 = objc_alloc((Class)IOUSBHostInterface);
  id v10 = [v83 holder];
  id v93 = 0;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_100011334;
  v91[3] = &unk_1000249A0;
  v74 = &v92;
  objc_copyWeak(&v92, &location);
  id v11 = (IOUSBHostInterface *)[v9 initWithIOService:v10 options:0 queue:0 error:&v93 interestHandler:v91];
  id v75 = v93;
  interface = val->_interface;
  val->_interface = v11;

  if ([(Device *)val handleEANotification])
  {
    [(Device *)val terminate];
    int v13 = 1;
    goto LABEL_95;
  }
  id v14 = val->_interface;
  uint64_t v15 = sub_10000F564();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v66 = [(Device *)val productId];
      unsigned int v85 = [v66 unsignedIntValue];
      v67 = [(Device *)val vendorId];
      unsigned int v68 = [v67 unsignedIntValue];
      v69 = [(Device *)val locationId];
      unsigned int v70 = [v69 unsignedIntValue];
      id v71 = [(Device *)val entryID];
      v3 = [(Device *)val vendorName];
      v72 = [(Device *)val productName];
      v73 = [(Device *)val interfaceName];
      *(_DWORD *)buf = 67110658;
      unsigned int v98 = v85;
      __int16 v99 = 1024;
      unsigned int v100 = v68;
      __int16 v101 = 1024;
      unsigned int v102 = v70;
      __int16 v103 = 2048;
      id v104 = v71;
      __int16 v105 = 2114;
      v106 = v3;
      __int16 v107 = 2114;
      v108 = v72;
      __int16 v109 = 2114;
      v110 = v73;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "new device arrival: %04x:%04x %x (entryId=%llx) (%{public}@ %{public}@ %{public}@)", buf, 0x3Cu);
    }
    uint64_t v17 = [(IOUSBHostInterface *)val->_interface CCIDDescriptor];
    CCIDDescriptor = val->_CCIDDescriptor;
    val->_CCIDDescriptor = (CCIDDescriptorView *)v17;

    uint64_t v19 = objc_opt_new();
    slots = val->_slots;
    val->_slots = (NSMutableArray *)v19;

    p_isa = (id *)&val->super.isa;
    if ([(CCIDDescriptorView *)val->_CCIDDescriptor bMaxSlotIndex]
      && ((LODWORD(v22) = [(CCIDDescriptorView *)val->_CCIDDescriptor bMaxCCIDBusySlots],
           v22 <= 1)
        ? (intptr_t v22 = 1)
        : (intptr_t v22 = v22),
          dispatch_semaphore_t v23 = dispatch_semaphore_create(v22),
          slotSemaphore = val->_slotSemaphore,
          val->_slotSemaphore = (OS_dispatch_semaphore *)v23,
          slotSemaphore,
          p_isa = (id *)&val->super.isa,
          !val->_slotSemaphore))
    {
      v16 = sub_10000F564();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000191F0();
      }
    }
    else
    {
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v25 = [p_isa[2] pipes];
      v16 = 0;
      id v26 = [v25 countByEnumeratingWithState:&v87 objects:v96 count:16];
      if (v26)
      {
        v84 = 0;
        v27 = 0;
        v3 = *(void **)v88;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void **)v88 != v3) {
              objc_enumerationMutation(v25);
            }
            v29 = *(void **)(*((void *)&v87 + 1) + 8 * i);
            if ([v29 endpointType] == 2
              && [v29 endpointDirection] == 1)
            {
              v30 = v29;
              v31 = v16;
              v16 = v30;
            }
            else if ([v29 endpointType] == 2 {
                   && ![v29 endpointDirection])
            }
            {
              v33 = v29;
              v31 = v84;
              v84 = v33;
            }
            else if ([v29 endpointType] == 3 {
                   && [v29 endpointDirection] == 1)
            }
            {
              v32 = v29;
              v31 = v27;
              v27 = v32;
            }
            else
            {
              v31 = sub_10000F564();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
                sub_1000191B0(buf, &buf[1], v31);
              }
            }
          }
          id v26 = [v25 countByEnumeratingWithState:&v87 objects:v96 count:16];
        }
        while (v26);
      }
      else
      {
        v84 = 0;
        v27 = 0;
      }

      v34 = val;
      unsigned int v35 = 0;
      if (*((unsigned char *)[(IOUSBHostInterface *)val->_interface interfaceDescriptor] + 7)) {
        BOOL v36 = 1;
      }
      else {
        BOOL v36 = v16 == 0;
      }
      char v38 = v36 || v84 == 0;
      char v82 = v38;
      while (1)
      {
        v39 = [(Device *)v34 CCIDDescriptor];
        uint64_t v40 = v35 > [v39 bMaxSlotIndex];

        if (v40) {
          break;
        }
        v41 = [(Device *)val vendorName];
        v42 = [(Device *)val interfaceName];
        if (v42)
        {
          v3 = [(Device *)val interfaceName];
          long long v25 = [(Device *)val productName];
          if ([v3 containsString:v25])
          {
            uint64_t v43 = [(Device *)val interfaceName];
            int v44 = 0;
            int v45 = 1;
            v80 = (void *)v43;
          }
          else
          {
            uint64_t v43 = [(Device *)val productName];
            int v45 = 0;
            int v44 = 1;
            v81 = (void *)v43;
          }
        }
        else
        {
          uint64_t v43 = [(Device *)val productName];
          int v45 = 0;
          int v44 = 0;
          v79 = (void *)v43;
        }
        v46 = +[NSMutableString stringWithFormat:@"%@ %@", v41, v43, v74, v75];
        if (!v42) {

        }
        if (v44) {
        if (v45)
        }

        if (v42)
        {
        }
        if (qword_10002C2F8 != -1) {
          dispatch_once(&qword_10002C2F8, &stru_100024A30);
        }
        v47 = val;
        if (byte_10002C2F0)
        {
          v48 = [(Device *)val locationId];
          [v46 appendFormat:@"[%@]", v48];

          v47 = val;
        }
        v49 = [(Device *)v47 CCIDDescriptor];
        BOOL v50 = [v49 bMaxSlotIndex] == 0;

        if (!v50) {
          objc_msgSend(v46, "appendFormat:", @"(%d)", v35 + 1);
        }
        if (v82)
        {
          v51 = 0;
        }
        else
        {
          v51 = [[CCIDSlot alloc] initWithDevice:val slotName:v46 slotNumber:v35 pipeIn:v16 pipeOut:v84];
          if (v51) {
            [(NSMutableArray *)val->_slots addObject:v51];
          }
        }

        ++v35;
        v34 = val;
      }
      if ([(NSMutableArray *)val->_slots count])
      {
        if (v27) {
          [(Device *)val watchInterruptPipe:v27];
        }
        v52 = [(Device *)val vendorName];
        v53 = [(Device *)val interfaceName];
        if (v53)
        {
          uint64_t v40 = [(Device *)val interfaceName];
          v3 = [(Device *)val productName];
          if ([(id)v40 containsString:v3])
          {
            v54 = [(Device *)val interfaceName];
            int v55 = 0;
            int v56 = 1;
          }
          else
          {
            v54 = [(Device *)val productName];
            int v56 = 0;
            int v55 = 1;
          }
        }
        else
        {
          v54 = [(Device *)val productName];
          int v56 = 0;
          int v55 = 0;
        }
        v58 = +[NSMutableString stringWithFormat:@"%@ %@", v52, v54];
        if (!v53) {

        }
        if (v55) {
        if (v56)
        }

        if (v53)
        {
        }
        id v59 = +[NSString stringWithFormat:@"com.apple.ccid:%@", v58];
        [v59 UTF8String];
        uint64_t v60 = os_transaction_create();
        transaction = val->_transaction;
        val->_transaction = (OS_os_transaction *)v60;

        int v13 = 0;
        goto LABEL_94;
      }
      v57 = sub_10000F564();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
        sub_10001917C();
      }
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    sub_100019104((uint64_t)v75, v16);
  }
  int v13 = 1;
LABEL_94:

LABEL_95:
  objc_destroyWeak(v74);
  objc_destroyWeak(&location);

  if (v13)
  {
    v62 = 0;
    goto LABEL_102;
  }
LABEL_97:
  v63 = sub_10000F564();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
    sub_10001908C((uint64_t)val, v63);
  }

  v64 = sub_10000F564();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
    sub_100018FF8(val);
  }

  v62 = val;
LABEL_102:

  return v62;
}

- (void)watchInterruptPipe:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(Device *)self interruptionSync];
  v6 = [v5 queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011588;
  v8[3] = &unk_1000249F0;
  objc_copyWeak(&v11, &location);
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

+ (void)registerService:(id)a3
{
  id v3 = a3;
  id v4 = +[Device synchronize];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001184C;
  v6[3] = &unk_1000244C0;
  id v7 = v3;
  id v5 = v3;
  [v4 sync:v6];
}

- (id)deviceAccessBlock:(id)a3
{
  slotSemaphore = self->_slotSemaphore;
  if (slotSemaphore)
  {
    id v5 = (void (**)(void))a3;
    dispatch_semaphore_wait(slotSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v6 = v5[2](v5);

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_slotSemaphore);
  }
  else
  {
    id v7 = (void (*)(void))*((void *)a3 + 2);
    id v8 = a3;
    v6 = v7();
  }

  return v6;
}

- (Synchronize)interruptionSync
{
  return (Synchronize *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)entryID
{
  return self->_entryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptionSync, 0);
  objc_storeStrong((id *)&self->_slotSemaphore, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_CCIDDescriptor, 0);
  objc_storeStrong((id *)&self->_slots, 0);

  objc_storeStrong((id *)&self->_interface, 0);
}

@end