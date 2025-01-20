@interface Thunderbolt
@end

@implementation Thunderbolt

void __get_kCAEvent_Thunderbolt_Daily_block_invoke(id a1)
{
  v13[0] = @"switchType";
  v13[1] = @"routerID";
  v13[2] = @"vendorID";
  v13[3] = @"deviceID";
  v13[4] = @"revisionID";
  v13[5] = @"deviceVendorID";
  v13[6] = @"deviceVendorName";
  v13[7] = @"deviceModelID";
  v13[8] = @"deviceModelName";
  v13[9] = @"deviceModelRevision";
  v13[10] = @"thunderboltVersion";
  v13[11] = @"romVersion";
  v13[12] = @"romRevision";
  v13[13] = @"depth";
  v13[14] = @"routeString";
  v13[15] = @"priSupLinkWidth";
  v13[16] = @"priSupLinkSpeed";
  v13[17] = @"priTarLinkWidth";
  v13[18] = @"priTarLinkSpeed";
  v13[19] = @"priCurLinkWidth";
  v13[20] = @"priCurLinkSpeed";
  v13[21] = @"secSupLinkWidth";
  v13[22] = @"secSupLinkSpeed";
  v13[23] = @"secTarLinkWidth";
  v13[24] = @"secTarLinkSpeed";
  v13[25] = @"secCurLinkWidth";
  v13[26] = @"secCurLinkSpeed";
  v13[27] = @"nvmLoadFailed";
  id v1 = +[NSArray arrayWithObjects:v13 count:28];
  if (get_ThunderboltFields_onceToken != -1) {
    dispatch_once(&get_ThunderboltFields_onceToken, &__block_literal_global_88);
  }
  id v2 = (id)get_ThunderboltFields_thunderboltFields;
  if (v1)
  {
    v3 = (void *)get_ThunderboltFields_thunderboltFields;
    v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    v10 = __get_ThunderboltFields_block_invoke_2;
    v11 = &unk_20670;
    id v12 = v1;
    v4 = [v3 indexesOfObjectsPassingTest:&v8];
    uint64_t v5 = objc_msgSend((id)get_ThunderboltFields_thunderboltFields, "objectsAtIndexes:", v4, v8, v9, v10, v11);

    id v2 = (id)v5;
  }

  uint64_t v6 = +[CAEvent eventWithName:@"com.apple.peripheral.thunderbolt.IOThunderboltSwitch.Daily" fields:v2];
  v7 = (void *)get_kCAEvent_Thunderbolt_Daily_event;
  get_kCAEvent_Thunderbolt_Daily_event = v6;
}

@end