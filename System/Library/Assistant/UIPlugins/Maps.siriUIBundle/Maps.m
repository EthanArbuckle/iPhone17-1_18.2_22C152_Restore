id MapsCachedConformsToProtocol(uint64_t a1, Protocol *a2)
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unsigned int v23;

  v3 = objc_opt_class();
  if (!v3) {
    return 0;
  }
  v4 = (void *)v3;
  if (qword_51AF8 != -1)
  {
    dispatch_once(&qword_51AF8, &stru_2C660);
    if (a2) {
      goto LABEL_4;
    }
    return 0;
  }
  if (!a2) {
    return 0;
  }
LABEL_4:
  v5 = atomic_load((unsigned int *)dword_4E200);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_51AE8);
  v6 = [(id)qword_51AF0 objectForKey:v4];
  if (!v6)
  {
    v6 = +[NSMapTable mapTableWithKeyOptions:256 valueOptions:0];
    [(id)qword_51AF0 setObject:v6 forKey:v4];
  }
  v7 = objc_msgSend(objc_msgSend(v6, "objectForKey:", a2), "unsignedIntegerValue");
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_51AE8);
  if (v5 == v7 >> 1) {
    return (id)(v7 & 1);
  }
  v8 = [v4 conformsToProtocol:a2];
  if (qword_51B08 != -1) {
    dispatch_once(&qword_51B08, &stru_2C680);
  }
  v9 = (void *)qword_51B00;
  if (os_log_type_enabled((os_log_t)qword_51B00, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = NSStringFromClass((Class)v4);
    if (v8) {
      v12 = "conforms to";
    }
    else {
      v12 = "does not conform to";
    }
    v13 = NSStringFromProtocol(a2);
    v16 = 138544130;
    v17 = v11;
    v18 = 2080;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    v22 = 1024;
    v23 = v5;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%{public}@ %s %{public}@ (gen: %u)", (uint8_t *)&v16, 0x26u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_51AE8);
  v14 = +[NSNumber numberWithUnsignedInt:v8 | (2 * v5)];
  [v6 setObject:v14 forKey:a2];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_51AE8);
  return v8;
}

void sub_4450(id a1)
{
  objc_addLoadImageFunc((objc_func_loadImage)sub_44AC);
  qword_51AF0 = +[NSMapTable mapTableWithKeyOptions:256 valueOptions:0];

  _objc_release_x1();
}

void sub_44AC()
{
}

void sub_44C0(id a1)
{
  qword_51B00 = (uint64_t)os_log_create("com.apple.Maps", "MapsProtocolConformance");

  _objc_release_x1();
}

void sub_47C8(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v15)
  {
    v6 = [*(id *)(a1 + 32) location];
    v7 = [v6 clRepresentation];
    [v15 distanceFromLocation:v7];
    double v9 = v8;

    *(double *)(*(void *)(a1 + 40) + 32) = v9;
    v10 = [*(id *)(a1 + 32) location];
    LODWORD(v7) = [v10 isRegionCity];

    if (v7)
    {
      v11 = [*(id *)(a1 + 32) location];
      v12 = [v11 city];
      [*(id *)(a1 + 40) setTitle:v12];

      v13 = +[SADistance localizedStringForDistanceInMeters:1 forCity:v9];
      [*(id *)(a1 + 40) setSubtitle:v13];
    }
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    (*(void (**)(void))(v14 + 16))();
  }
}

id sub_4DF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) urlForMapItemsWithLaunchOptions:*(void *)(a1 + 40)];
}

void *MapsConfig_GetUserDefaultStringKeysForWatchSync()
{
  return &__NSArray0__struct;
}

_UNKNOWN **MapsConfig_GetConfigStoreStringKeysForWatchSync()
{
  return &off_43F30;
}

id sub_51B4(id a1)
{
  return &__kCFBooleanTrue;
}

void sub_51C0()
{
  if (qword_51B10 != -1) {
    dispatch_once(&qword_51B10, &stru_36FA0);
  }
}

void sub_51E8(id a1)
{
  byte_51348 = 1;
  __GEOConfigRegisterStateCaptureFunctions(sub_5218, sub_5224);
}

_UNKNOWN **sub_5218()
{
  return &off_43F48;
}

_UNKNOWN **sub_5224()
{
  return &off_43F60;
}

id sub_5230(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_523C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5248(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5254(id a1)
{
  return &off_44008;
}

id sub_5260(id a1)
{
  return &off_44020;
}

id sub_526C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5278(id a1)
{
  v1 = +[GEOPlatform sharedPlatform];
  v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 isInternalInstall]);

  return v2;
}

id sub_52E0(id a1)
{
  return &off_44710;
}

id sub_52EC(id a1)
{
  return &off_44720;
}

id sub_52F8(id a1)
{
  return &off_44730;
}

id sub_5304(id a1)
{
  return &off_44740;
}

id sub_5310(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_531C(id a1)
{
  return &off_44038;
}

id sub_5328(id a1)
{
  return &off_44050;
}

id sub_5334(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5340(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_534C(id a1)
{
  return &off_44068;
}

id sub_5358(id a1)
{
  return &off_44080;
}

id sub_5364(id a1)
{
  return &off_44098;
}

id sub_5370(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_537C(id a1)
{
  return &off_43F78;
}

id sub_5388(id a1)
{
  return &off_44750;
}

id sub_5394(id a1)
{
  return &off_44760;
}

id sub_53A0(id a1)
{
  return &off_44068;
}

id sub_53AC(id a1)
{
  return 0;
}

id sub_53B4(id a1)
{
  return &off_44770;
}

id sub_53C0(id a1)
{
  return &off_44780;
}

id sub_53CC(id a1)
{
  return &off_44790;
}

id sub_53D8(id a1)
{
  return &off_447A0;
}

id sub_53E4(id a1)
{
  return &off_447B0;
}

id sub_53F0(id a1)
{
  return &off_44750;
}

id sub_53FC(id a1)
{
  return &off_447C0;
}

id sub_5408(id a1)
{
  return &off_447A0;
}

id sub_5414(id a1)
{
  return &off_44020;
}

id sub_5420(id a1)
{
  return &off_447D0;
}

id sub_542C(id a1)
{
  return &off_447B0;
}

id sub_5438(id a1)
{
  return &off_447E0;
}

id sub_5444(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5450(id a1)
{
  return &off_440B0;
}

id sub_545C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5468(id a1)
{
  return &off_440C8;
}

id sub_5474(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5480(id a1)
{
  return &off_440E0;
}

id sub_548C(id a1)
{
  return &off_44770;
}

id sub_5498(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_54A4(id a1)
{
  return 0;
}

id sub_54AC(id a1)
{
  return &off_447F0;
}

id sub_54B8(id a1)
{
  return &off_440F8;
}

id sub_54C4(id a1)
{
  return &off_44050;
}

id sub_54D0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_54DC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_54E8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_54F4(id a1)
{
  return &off_44020;
}

id sub_5500(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_550C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5518(id a1)
{
  return &off_44110;
}

id sub_5524(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5530(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_553C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5548(id a1)
{
  return &off_44128;
}

id sub_5554(id a1)
{
  return &off_447A0;
}

id sub_5560(id a1)
{
  return &off_44800;
}

id sub_556C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5578(id a1)
{
  return &off_44140;
}

id sub_5584(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5590(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_559C(id a1)
{
  return &off_44050;
}

id sub_55A8(id a1)
{
  return &off_44020;
}

id sub_55B4(id a1)
{
  return &off_44158;
}

id sub_55C0(id a1)
{
  return &off_44170;
}

id sub_55CC(id a1)
{
  return &off_44188;
}

id sub_55D8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_55E4(id a1)
{
  return &off_441A0;
}

id sub_55F0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_55FC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5608(id a1)
{
  return &off_441B8;
}

id sub_5614(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5620(id a1)
{
  return &off_44800;
}

id sub_562C(id a1)
{
  return &off_44770;
}

id sub_5638(id a1)
{
  return &off_441D0;
}

id sub_5644(id a1)
{
  return &off_441A0;
}

id sub_5650(id a1)
{
  return &off_441D0;
}

id sub_565C(id a1)
{
  return &off_441E8;
}

id sub_5668(id a1)
{
  return &off_44200;
}

id sub_5674(id a1)
{
  return &off_44810;
}

id sub_5680(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_568C(id a1)
{
  return &off_44218;
}

id sub_5698(id a1)
{
  return &off_44020;
}

id sub_56A4(id a1)
{
  return &off_44218;
}

id sub_56B0(id a1)
{
  return &off_441A0;
}

id sub_56BC(id a1)
{
  return &off_44020;
}

id sub_56C8(id a1)
{
  return &off_44020;
}

id sub_56D4(id a1)
{
  return &off_440E0;
}

id sub_56E0(id a1)
{
  return &off_44230;
}

id sub_56EC(id a1)
{
  return &off_44248;
}

id sub_56F8(id a1)
{
  return &off_44260;
}

id sub_5704(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5710(id a1)
{
  return &off_44278;
}

id sub_571C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5728(id a1)
{
  return @"inbox.appleid.apple.com";
}

id sub_5734(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5740(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_574C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5758(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5764(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5770(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_577C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5788(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5794(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_57A0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_57AC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_57B8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_57C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_57D0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_57DC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_57E8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_57F4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5800(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_580C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5818(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5824(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5830(id a1)
{
  return &off_44290;
}

id sub_583C(id a1)
{
  return &off_44218;
}

id sub_5848(id a1)
{
  return &off_44A80;
}

id sub_5854(id a1)
{
  return &off_44A90;
}

id sub_5860(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_586C(id a1)
{
  return &off_44260;
}

id sub_5878(id a1)
{
  return &off_44260;
}

id sub_5884(id a1)
{
  return &off_441A0;
}

id sub_5890(id a1)
{
  return &off_44158;
}

id sub_589C(id a1)
{
  return &off_44260;
}

id sub_58A8(id a1)
{
  return &off_442A8;
}

id sub_58B4(id a1)
{
  return &off_44098;
}

id sub_58C0(id a1)
{
  return &off_44218;
}

id sub_58CC(id a1)
{
  return &off_44218;
}

id sub_58D8(id a1)
{
  return &off_44218;
}

id sub_58E4(id a1)
{
  return &off_44020;
}

id sub_58F0(id a1)
{
  return &off_442C0;
}

id sub_58FC(id a1)
{
  return &off_441D0;
}

id sub_5908(id a1)
{
  return 0;
}

id sub_5910(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_591C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5928(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5934(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5940(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_594C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5958(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5964(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5970(id a1)
{
  return &off_442D8;
}

id sub_597C(id a1)
{
  return &off_44820;
}

id sub_5988(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5994(id a1)
{
  return &off_447F0;
}

id sub_59A0(id a1)
{
  return &off_44830;
}

id sub_59AC(id a1)
{
  return &off_442F0;
}

id sub_59B8(id a1)
{
  return &off_44260;
}

id sub_59C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_59D0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_59DC(id a1)
{
  return &off_44740;
}

id sub_59E8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_59F4(id a1)
{
  return &off_44278;
}

id sub_5A00(id a1)
{
  return &off_44840;
}

id sub_5A0C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5A18(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5A24(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5A30(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5A3C(id a1)
{
  return &off_44850;
}

id sub_5A48(id a1)
{
  return &off_44780;
}

id sub_5A54(id a1)
{
  return &off_44860;
}

id sub_5A60(id a1)
{
  return &off_44870;
}

id sub_5A6C(id a1)
{
  return &off_441A0;
}

id sub_5A78(id a1)
{
  return &off_44880;
}

id sub_5A84(id a1)
{
  return &off_44760;
}

id sub_5A90(id a1)
{
  return &off_44890;
}

id sub_5A9C(id a1)
{
  return &off_448A0;
}

id sub_5AA8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5AB4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5AC0(id a1)
{
  return &off_44770;
}

id sub_5ACC(id a1)
{
  return &off_448B0;
}

id sub_5AD8(id a1)
{
  return &off_44050;
}

id sub_5AE4(id a1)
{
  return &off_44248;
}

id sub_5AF0(id a1)
{
  return &off_441B8;
}

id sub_5AFC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5B08(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5B14(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5B20(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5B2C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5B38(id a1)
{
  return &off_44020;
}

id sub_5B44(id a1)
{
  return &off_44308;
}

id sub_5B50(id a1)
{
  return &off_447C0;
}

id sub_5B5C(id a1)
{
  return &off_448A0;
}

id sub_5B68(id a1)
{
  return &off_448C0;
}

id sub_5B74(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5B80(id a1)
{
  return &off_44158;
}

id sub_5B8C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5B98(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5BA4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5BB0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5BBC(id a1)
{
  return &off_44320;
}

id sub_5BC8(id a1)
{
  return &off_44050;
}

id sub_5BD4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5BE0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5BEC(id a1)
{
  return &off_441B8;
}

id sub_5BF8(id a1)
{
  return &off_44098;
}

id sub_5C04(id a1)
{
  return &off_44338;
}

id sub_5C10(id a1)
{
  return &off_44350;
}

id sub_5C1C(id a1)
{
  return &off_44350;
}

id sub_5C28(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5C34(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5C40(id a1)
{
  return &off_44368;
}

id sub_5C4C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5C58(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5C64(id a1)
{
  return &off_442A8;
}

id sub_5C70(id a1)
{
  return &off_440E0;
}

id sub_5C7C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5C88(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5C94(id a1)
{
  return &off_44158;
}

id sub_5CA0(id a1)
{
  return &off_44380;
}

id sub_5CAC(id a1)
{
  return &off_44008;
}

id sub_5CB8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5CC4(id a1)
{
  return &off_44050;
}

id sub_5CD0(id a1)
{
  return &off_448D0;
}

id sub_5CDC(id a1)
{
  return &off_448E0;
}

id sub_5CE8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5CF4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5D00(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5D0C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5D18(id a1)
{
  return &off_44050;
}

id sub_5D24(id a1)
{
  return &off_44050;
}

id sub_5D30(id a1)
{
  return &off_44750;
}

id sub_5D3C(id a1)
{
  return &off_440E0;
}

id sub_5D48(id a1)
{
  return &off_44398;
}

id sub_5D54(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5D60(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5D6C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5D78(id a1)
{
  return &off_44840;
}

id sub_5D84(id a1)
{
  return &off_441A0;
}

id sub_5D90(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5D9C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5DA8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5DB4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5DC0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5DCC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5DD8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5DE4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5DF0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5DFC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5E08(id a1)
{
  return &off_448B0;
}

id sub_5E14(id a1)
{
  return &off_44770;
}

id sub_5E20(id a1)
{
  return &off_448F0;
}

id sub_5E2C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5E38(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5E44(id a1)
{
  return &off_44248;
}

id sub_5E50(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5E5C(id a1)
{
  return &off_44770;
}

id sub_5E68(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5E74(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5E80(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5E8C(id a1)
{
  return &off_44350;
}

id sub_5E98(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5EA4(id a1)
{
  return &off_44050;
}

id sub_5EB0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5EBC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5EC8(id a1)
{
  return &off_44218;
}

id sub_5ED4(id a1)
{
  return &off_44308;
}

id sub_5EE0(id a1)
{
  return &off_447D0;
}

id sub_5EEC(id a1)
{
  return &off_440E0;
}

id sub_5EF8(id a1)
{
  return &off_440E0;
}

id sub_5F04(id a1)
{
  return &off_44158;
}

id sub_5F10(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5F1C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5F28(id a1)
{
  return &off_44260;
}

id sub_5F34(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5F40(id a1)
{
  return @"https://www.apple.com/legal/internet-services/maps/ratings-photos/";
}

id sub_5F4C(id a1)
{
  return &off_44020;
}

id sub_5F58(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5F64(id a1)
{
  return &off_441A0;
}

id sub_5F70(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5F7C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5F88(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5F94(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_5FA0(id a1)
{
  return &off_443B0;
}

id sub_5FAC(id a1)
{
  return &off_443C8;
}

id sub_5FB8(id a1)
{
  return &off_443E0;
}

id sub_5FC4(id a1)
{
  return &off_443F8;
}

id sub_5FD0(id a1)
{
  return &off_44900;
}

id sub_5FDC(id a1)
{
  return &off_44910;
}

id sub_5FE8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_5FF4(id a1)
{
  return &off_44920;
}

id sub_6000(id a1)
{
  return &off_44930;
}

id sub_600C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6018(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6024(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6030(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_603C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6048(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6054(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6060(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_606C(id a1)
{
  return &off_441D0;
}

id sub_6078(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6084(id a1)
{
  return &off_441A0;
}

id sub_6090(id a1)
{
  return &off_44248;
}

id sub_609C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_60A8(id a1)
{
  return @"https://www.apple.com/ios/feature-availability/#maps-cycling";
}

id sub_60B4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_60C0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_60CC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_60D8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_60E4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_60F0(id a1)
{
  return &off_44050;
}

id sub_60FC(id a1)
{
  return &off_440C8;
}

id sub_6108(id a1)
{
  return &off_44290;
}

id sub_6114(id a1)
{
  return &off_44350;
}

id sub_6120(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_612C(id a1)
{
  return &off_44338;
}

id sub_6138(id a1)
{
  return &off_44098;
}

id sub_6144(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6150(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_615C(id a1)
{
  return &off_441A0;
}

id sub_6168(id a1)
{
  return &off_44338;
}

id sub_6174(id a1)
{
  return &off_44158;
}

id sub_6180(id a1)
{
  return &off_441B8;
}

id sub_618C(id a1)
{
  return &off_44350;
}

id sub_6198(id a1)
{
  return &off_44098;
}

id sub_61A4(id a1)
{
  return &off_43F90;
}

id sub_61B0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_61BC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_61C8(id a1)
{
  return &off_44398;
}

id sub_61D4(id a1)
{
  return &off_443B0;
}

id sub_61E0(id a1)
{
  return &off_44320;
}

id sub_61EC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_61F8(id a1)
{
  return &off_44428;
}

id sub_6204(id a1)
{
  return &off_44428;
}

id sub_6210(id a1)
{
  return &off_440E0;
}

id sub_621C(id a1)
{
  return 0;
}

id sub_6224(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6230(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_623C(id a1)
{
  return 0;
}

id sub_6244(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6250(id a1)
{
  return &off_44050;
}

id sub_625C(id a1)
{
  return &off_44050;
}

id sub_6268(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6274(id a1)
{
  return &off_44440;
}

id sub_6280(id a1)
{
  return &off_44158;
}

id sub_628C(id a1)
{
  return &off_440B0;
}

id sub_6298(id a1)
{
  return &off_44458;
}

id sub_62A4(id a1)
{
  return @"https://www.apple.com/legal/internet-services/maps/";
}

id sub_62B0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_62BC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_62C8(id a1)
{
  return &off_44248;
}

id sub_62D4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_62E0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_62EC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_62F8(id a1)
{
  return &off_44098;
}

id sub_6304(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6310(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_631C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6328(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6334(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6340(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_634C(id a1)
{
  return &off_447D0;
}

id sub_6358(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6364(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6370(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_637C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6388(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6394(id a1)
{
  return &off_44218;
}

id sub_63A0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_63AC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_63B8(id a1)
{
  return &off_441B8;
}

id sub_63C4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_63D0(id a1)
{
  return &off_44218;
}

id sub_63DC(id a1)
{
  return &off_44940;
}

id sub_63E8(id a1)
{
  return &off_44218;
}

id sub_63F4(id a1)
{
  return &off_44050;
}

id sub_6400(id a1)
{
  return &off_44020;
}

id sub_640C(id a1)
{
  return &off_441A0;
}

id sub_6418(id a1)
{
  return &off_44218;
}

id sub_6424(id a1)
{
  return &off_44470;
}

id sub_6430(id a1)
{
  return &off_44050;
}

id sub_643C(id a1)
{
  return &off_44020;
}

id sub_6448(id a1)
{
  return &off_44158;
}

id sub_6454(id a1)
{
  return &off_44218;
}

id sub_6460(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_646C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6478(id a1)
{
  return &off_44488;
}

id sub_6484(id a1)
{
  return &off_44080;
}

id sub_6490(id a1)
{
  return &off_44260;
}

id sub_649C(id a1)
{
  return &off_442D8;
}

id sub_64A8(id a1)
{
  return &off_44260;
}

id sub_64B4(id a1)
{
  return &off_44260;
}

id sub_64C0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_64CC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_64D8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_64E4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_64F0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_64FC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6508(id a1)
{
  return &off_44950;
}

id sub_6514(id a1)
{
  return 0;
}

id sub_651C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6528(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6534(id a1)
{
  return &off_447C0;
}

id sub_6540(id a1)
{
  return &off_44960;
}

id sub_654C(id a1)
{
  return &off_441A0;
}

id sub_6558(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6564(id a1)
{
  return &off_44850;
}

id sub_6570(id a1)
{
  return &off_441D0;
}

id sub_657C(id a1)
{
  return &off_44008;
}

id sub_6588(id a1)
{
  return &off_444A0;
}

id sub_6594(id a1)
{
  return &off_444B8;
}

id sub_65A0(id a1)
{
  return &off_447A0;
}

id sub_65AC(id a1)
{
  return &off_44170;
}

id sub_65B8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_65C4(id a1)
{
  return &off_44820;
}

id sub_65D0(id a1)
{
  return &off_44260;
}

id sub_65DC(id a1)
{
  return &off_44050;
}

id sub_65E8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_65F4(id a1)
{
  return &off_44260;
}

id sub_6600(id a1)
{
  return &off_44260;
}

id sub_660C(id a1)
{
  return &off_44970;
}

id sub_6618(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6624(id a1)
{
  return &off_44980;
}

id sub_6630(id a1)
{
  return &off_440E0;
}

id sub_663C(id a1)
{
  return &off_440E0;
}

id sub_6648(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6654(id a1)
{
  return &off_44338;
}

id sub_6660(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_666C(id a1)
{
  return &off_44850;
}

id sub_6678(id a1)
{
  return &off_44820;
}

id sub_6684(id a1)
{
  return &off_447A0;
}

id sub_6690(id a1)
{
  return &off_44470;
}

id sub_669C(id a1)
{
  return &off_44050;
}

id sub_66A8(id a1)
{
  return &off_442F0;
}

id sub_66B4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_66C0(id a1)
{
  return &off_44750;
}

id sub_66CC(id a1)
{
  return &off_44820;
}

id sub_66D8(id a1)
{
  return &off_44990;
}

id sub_66E4(id a1)
{
  return &off_44820;
}

id sub_66F0(id a1)
{
  return &off_449A0;
}

id sub_66FC(id a1)
{
  return &off_44820;
}

id sub_6708(id a1)
{
  return &off_449B0;
}

id sub_6714(id a1)
{
  return &off_44820;
}

id sub_6720(id a1)
{
  return &off_449C0;
}

id sub_672C(id a1)
{
  return &off_44820;
}

id sub_6738(id a1)
{
  return &off_44990;
}

id sub_6744(id a1)
{
  return &off_44820;
}

id sub_6750(id a1)
{
  return &off_44880;
}

id sub_675C(id a1)
{
  return &off_44820;
}

id sub_6768(id a1)
{
  return &off_449D0;
}

id sub_6774(id a1)
{
  return &off_44990;
}

id sub_6780(id a1)
{
  return &off_44820;
}

id sub_678C(id a1)
{
  return &off_449A0;
}

id sub_6798(id a1)
{
  return &off_44820;
}

id sub_67A4(id a1)
{
  return &off_44850;
}

id sub_67B0(id a1)
{
  return &off_44820;
}

id sub_67BC(id a1)
{
  return 0;
}

id sub_67C4(id a1)
{
  return 0;
}

id sub_67CC(id a1)
{
  return &off_444D0;
}

id sub_67D8(id a1)
{
  return &off_442F0;
}

id sub_67E4(id a1)
{
  return 0;
}

id sub_67EC(id a1)
{
  return &off_444E8;
}

id sub_67F8(id a1)
{
  return 0;
}

id sub_6800(id a1)
{
  return 0;
}

id sub_6808(id a1)
{
  return &off_44050;
}

id sub_6814(id a1)
{
  return &off_44020;
}

id sub_6820(id a1)
{
  return &off_440E0;
}

id sub_682C(id a1)
{
  return &off_440E0;
}

id sub_6838(id a1)
{
  return &off_44500;
}

id sub_6844(id a1)
{
  return &off_44050;
}

id sub_6850(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_685C(id a1)
{
  return &off_441A0;
}

id sub_6868(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6874(id a1)
{
  return &off_44008;
}

id sub_6880(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_688C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6898(id a1)
{
  return &off_44020;
}

id sub_68A4(id a1)
{
  return &off_44260;
}

id sub_68B0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_68BC(id a1)
{
  return &off_44350;
}

id sub_68C8(id a1)
{
  return &off_44098;
}

id sub_68D4(id a1)
{
  return &off_44338;
}

id sub_68E0(id a1)
{
  return &off_44218;
}

id sub_68EC(id a1)
{
  return &off_44008;
}

id sub_68F8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6904(id a1)
{
  return &off_443F8;
}

id sub_6910(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_691C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6928(id a1)
{
  return &off_440E0;
}

id sub_6934(id a1)
{
  return &off_441D0;
}

id sub_6940(id a1)
{
  return &off_44050;
}

id sub_694C(id a1)
{
  return &off_44488;
}

id sub_6958(id a1)
{
  return &off_44AA0;
}

id sub_6964(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6970(id a1)
{
  return &off_441A0;
}

id sub_697C(id a1)
{
  return &off_44248;
}

id sub_6988(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6994(id a1)
{
  return &off_44518;
}

id sub_69A0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_69AC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_69B8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_69C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_69D0(id a1)
{
  return &off_44308;
}

id sub_69DC(id a1)
{
  return &off_44260;
}

id sub_69E8(id a1)
{
  return &off_44110;
}

id sub_69F4(id a1)
{
  return &off_44AC8;
}

id sub_6A00(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6A0C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6A18(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6A24(id a1)
{
  return &off_44970;
}

id sub_6A30(id a1)
{
  return &off_440E0;
}

id sub_6A3C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6A48(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6A54(id a1)
{
  return &off_44158;
}

id sub_6A60(id a1)
{
  return &off_44248;
}

id sub_6A6C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6A78(id a1)
{
  return &off_44158;
}

id sub_6A84(id a1)
{
  return &off_44008;
}

id sub_6A90(id a1)
{
  return &off_44020;
}

id sub_6A9C(id a1)
{
  return &off_44020;
}

id sub_6AA8(id a1)
{
  return &off_44050;
}

id sub_6AB4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6AC0(id a1)
{
  return &off_447D0;
}

id sub_6ACC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6AD8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6AE4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6AF0(id a1)
{
  return &off_44200;
}

id sub_6AFC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6B08(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6B14(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6B20(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6B2C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6B38(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6B44(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6B50(id a1)
{
  return &off_447D0;
}

id sub_6B5C(id a1)
{
  return &off_44050;
}

id sub_6B68(id a1)
{
  return &off_44050;
}

id sub_6B74(id a1)
{
  return &off_441A0;
}

id sub_6B80(id a1)
{
  return &off_440E0;
}

id sub_6B8C(id a1)
{
  return &off_44970;
}

id sub_6B98(id a1)
{
  return &off_44920;
}

id sub_6BA4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6BB0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6BBC(id a1)
{
  return &off_44530;
}

id sub_6BC8(id a1)
{
  return &off_44530;
}

id sub_6BD4(id a1)
{
  return &off_44530;
}

id sub_6BE0(id a1)
{
  return &off_449E0;
}

id sub_6BEC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6BF8(id a1)
{
  return &off_44170;
}

id sub_6C04(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6C10(id a1)
{
  return &off_44098;
}

id sub_6C1C(id a1)
{
  return &off_44158;
}

id sub_6C28(id a1)
{
  return &off_44980;
}

id sub_6C34(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6C40(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6C4C(id a1)
{
  return &off_44128;
}

id sub_6C58(id a1)
{
  return &off_44128;
}

id sub_6C64(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6C70(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6C7C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6C88(id a1)
{
  return &off_44050;
}

id sub_6C94(id a1)
{
  return &off_44548;
}

id sub_6CA0(id a1)
{
  return &off_447C0;
}

id sub_6CAC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6CB8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6CC4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6CD0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6CDC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6CE8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6CF4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6D00(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6D0C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6D18(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6D24(id a1)
{
  return &off_441A0;
}

id sub_6D30(id a1)
{
  return &off_44218;
}

id sub_6D3C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6D48(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6D54(id a1)
{
  return 0;
}

id sub_6D5C(id a1)
{
  return 0;
}

id sub_6D64(id a1)
{
  return &off_449A0;
}

id sub_6D70(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6D7C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6D88(id a1)
{
  return &off_44560;
}

id sub_6D94(id a1)
{
  return &off_44248;
}

id sub_6DA0(id a1)
{
  return &off_447D0;
}

id sub_6DAC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6DB8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6DC4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6DD0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6DDC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6DE8(id a1)
{
  return &off_449F0;
}

id sub_6DF4(id a1)
{
  return &off_44A00;
}

id sub_6E00(id a1)
{
  return &off_442A8;
}

id sub_6E0C(id a1)
{
  return &off_44530;
}

id sub_6E18(id a1)
{
  return &off_44260;
}

id sub_6E24(id a1)
{
  return &off_44158;
}

id sub_6E30(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6E3C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6E48(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6E54(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6E60(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6E6C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6E78(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6E84(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6E90(id a1)
{
  return &off_441D0;
}

id sub_6E9C(id a1)
{
  return &off_44248;
}

id sub_6EA8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6EB4(id a1)
{
  return &off_441A0;
}

id sub_6EC0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6ECC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6ED8(id a1)
{
  return &off_44020;
}

id sub_6EE4(id a1)
{
  return &off_447D0;
}

id sub_6EF0(id a1)
{
  return &off_44158;
}

id sub_6EFC(id a1)
{
  return &off_44218;
}

id sub_6F08(id a1)
{
  return &off_44050;
}

id sub_6F14(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6F20(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6F2C(id a1)
{
  return &off_44218;
}

id sub_6F38(id a1)
{
  return &off_44158;
}

id sub_6F44(id a1)
{
  return &off_447D0;
}

id sub_6F50(id a1)
{
  return &__NSArray0__struct;
}

id sub_6F5C(id a1)
{
  return &off_44260;
}

id sub_6F68(id a1)
{
  return &off_44098;
}

id sub_6F74(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6F80(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6F8C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_6F98(id a1)
{
  return &off_44A10;
}

id sub_6FA4(id a1)
{
  return &off_44248;
}

id sub_6FB0(id a1)
{
  return &off_440E0;
}

id sub_6FBC(id a1)
{
  return &off_443E0;
}

id sub_6FC8(id a1)
{
  return &off_44820;
}

id sub_6FD4(id a1)
{
  return &off_44A20;
}

id sub_6FE0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_6FEC(id a1)
{
  return &off_44578;
}

id sub_6FF8(id a1)
{
  return &off_44590;
}

id sub_7004(id a1)
{
  return &off_44458;
}

id sub_7010(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_701C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7028(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_7034(id a1)
{
  return &off_44800;
}

id sub_7040(id a1)
{
  return &off_44A30;
}

id sub_704C(id a1)
{
  return &off_44920;
}

id sub_7058(id a1)
{
  return &off_44A40;
}

id sub_7064(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7070(id a1)
{
  return &off_44970;
}

id sub_707C(id a1)
{
  return &off_44320;
}

id sub_7088(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7094(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_70A0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_70AC(id a1)
{
  return &off_44158;
}

id sub_70B8(id a1)
{
  return &off_441D0;
}

id sub_70C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_70D0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_70DC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_70E8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_70F4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7100(id a1)
{
  return &off_445A8;
}

id sub_710C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_7118(id a1)
{
  return &off_44098;
}

id sub_7124(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_7130(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_713C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7148(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7154(id a1)
{
  return &off_440E0;
}

id sub_7160(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_716C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7178(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_7184(id a1)
{
  return &off_441A0;
}

id sub_7190(id a1)
{
  return &off_44970;
}

id sub_719C(id a1)
{
  return &off_44410;
}

id sub_71A8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_71B4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_71C0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_71CC(id a1)
{
  return &off_448F0;
}

id sub_71D8(id a1)
{
  return &off_445C0;
}

id sub_71E4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_71F0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_71FC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_7208(id a1)
{
  return &off_441D0;
}

id sub_7214(id a1)
{
  return &off_441D0;
}

id sub_7220(id a1)
{
  return &off_441D0;
}

id sub_722C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7238(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_7244(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7250(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_725C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_7268(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_7274(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7280(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_728C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7298(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_72A4(id a1)
{
  return &off_441D0;
}

id sub_72B0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_72BC(id a1)
{
  return &off_44440;
}

id sub_72C8(id a1)
{
  return &off_44218;
}

id sub_72D4(id a1)
{
  return &off_44218;
}

id sub_72E0(id a1)
{
  return &off_44020;
}

id sub_72EC(id a1)
{
  return &off_44218;
}

id sub_72F8(id a1)
{
  return &off_44950;
}

id sub_7304(id a1)
{
  return &off_445D8;
}

id sub_7310(id a1)
{
  return &off_445F0;
}

id sub_731C(id a1)
{
  return &off_44608;
}

id sub_7328(id a1)
{
  return &off_44620;
}

id sub_7334(id a1)
{
  return &off_44638;
}

id sub_7340(id a1)
{
  return &off_44650;
}

id sub_734C(id a1)
{
  return &off_44320;
}

id sub_7358(id a1)
{
  return &off_442C0;
}

id sub_7364(id a1)
{
  return &off_442C0;
}

id sub_7370(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_737C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7388(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7394(id a1)
{
  return &off_442C0;
}

id sub_73A0(id a1)
{
  return &off_44A50;
}

id sub_73AC(id a1)
{
  return &off_442C0;
}

id sub_73B8(id a1)
{
  return &off_44950;
}

id sub_73C4(id a1)
{
  return &off_440B0;
}

id sub_73D0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_73DC(id a1)
{
  return &off_442C0;
}

id sub_73E8(id a1)
{
  return &off_442C0;
}

id sub_73F4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7400(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_740C(id a1)
{
  return &off_44338;
}

id sub_7418(id a1)
{
  return &off_44050;
}

id sub_7424(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_7430(id a1)
{
  return &off_44158;
}

id sub_743C(id a1)
{
  return &off_44098;
}

id sub_7448(id a1)
{
  return &off_44488;
}

id sub_7454(id a1)
{
  return &off_443C8;
}

id sub_7460(id a1)
{
  return 0;
}

id sub_7468(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7474(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7480(id a1)
{
  return &off_44668;
}

id sub_748C(id a1)
{
  return &off_441D0;
}

id sub_7498(id a1)
{
  return &off_44218;
}

id sub_74A4(id a1)
{
  return &off_44158;
}

id sub_74B0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_74BC(id a1)
{
  return &off_44050;
}

id sub_74C8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_74D4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_74E0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_74EC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_74F8(id a1)
{
  return &off_44680;
}

id sub_7504(id a1)
{
  return &off_442F0;
}

id sub_7510(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_751C(id a1)
{
  v1 = +[GEOCountryConfiguration sharedConfiguration];
  v2 = [v1 countryCode];
  v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v2 isEqualToString:@"CN"] ^ 1);

  return v3;
}

id sub_75A4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_75B0(id a1)
{
  return 0;
}

id sub_75B8(id a1)
{
  return 0;
}

id sub_75C0(id a1)
{
  return &off_442C0;
}

id sub_75CC(id a1)
{
  return &off_44368;
}

id sub_75D8(id a1)
{
  return &off_440E0;
}

id sub_75E4(id a1)
{
  return &off_44260;
}

id sub_75F0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_75FC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7608(id a1)
{
  return 0;
}

id sub_7610(id a1)
{
  return &off_44698;
}

id sub_761C(id a1)
{
  return &off_44050;
}

id sub_7628(id a1)
{
  return &off_446B0;
}

id sub_7634(id a1)
{
  return &off_446C8;
}

id sub_7640(id a1)
{
  return &off_446E0;
}

id sub_764C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7658(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7664(id a1)
{
  return &off_446F8;
}

id sub_7670(id a1)
{
  return &off_44158;
}

id sub_767C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_7688(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_7694(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_76A0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_76AC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_76B8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_76C4(id a1)
{
  return &__kCFBooleanFalse;
}

uint64_t sub_7CCC(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  v6 = [v4 searchRegionCenter];
  [v5 coordinate];
  double v8 = v7;
  double v10 = v9;

  v11 = [*(id *)(a1 + 40) items];
  v12 = [v11 firstObject];
  uint64_t v15 = objc_msgSend(v3, "_headerLocationForSearchCenter:location:forMapItem:", v6, v12, v8, v10);

  if (v15) {
    [*(id *)(a1 + 32) setSubtitle:v15];
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }

  return _objc_release_x1();
}

void sub_9A98(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v14 = v5;
  if (a3 == 1)
  {
    [*(id *)(a1 + 32) setLocalizedDateFormatFromTemplate:@"Jmm"];
    id v5 = v14;
  }
  v6 = [v5 timeSlot];
  double v7 = [v6 timeZoneId];
  double v8 = +[NSTimeZone timeZoneWithName:v7];

  double v9 = *(void **)(a1 + 32);
  if (v8)
  {
    [*(id *)(a1 + 32) setTimeZone:v8];
  }
  else
  {
    double v10 = +[NSTimeZone defaultTimeZone];
    [v9 setTimeZone:v10];
  }
  v11 = *(void **)(a1 + 32);
  v12 = [v6 date];
  uint64_t v13 = [v11 stringFromDate:v12];

  [*(id *)(a1 + 40) addObject:v13];
}

void sub_A09C(id a1)
{
  qword_51B18 = +[NSBundle bundleWithIdentifier:@"com.apple.maps.assistant.uiplugin"];

  _objc_release_x1();
}

void sub_A1A4(id a1)
{
  qword_51B28 = (uint64_t)objc_alloc_init((Class)NSDateComponentsFormatter);

  _objc_release_x1();
}

void sub_A274(id a1)
{
  qword_51B38 = (uint64_t)objc_alloc_init((Class)NSDateFormatter);

  _objc_release_x1();
}

void sub_A304(id a1)
{
  id v3 = +[NSBundle afui_assistantUIFrameworkBundle];
  uint64_t v1 = [v3 assistantUILocale];
  v2 = (void *)qword_51B48;
  qword_51B48 = v1;
}

void sub_A440(id a1)
{
  qword_51B58 = (uint64_t)objc_alloc_init((Class)NSMeasurementFormatter);

  _objc_release_x1();
}

void sub_A5EC(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  v2 = (void *)qword_51B68;
  qword_51B68 = (uint64_t)v1;

  id v3 = (void *)qword_51B68;

  [v3 setMinimumIntegerDigits:1];
}

void sub_A8FC(uint64_t a1)
{
  v2 = objc_getAssociatedObject(*(id *)(a1 + 32), off_51420);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(v2, "copy", 0);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) performSelector:NSSelectorFromString(*(NSString **)(*((void *)&v8 + 1) + 8 * (void)v7))];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  objc_setAssociatedObject(*(id *)(a1 + 32), off_51420, 0, (char *)&dword_0 + 1);
  objc_setAssociatedObject(*(id *)(a1 + 32), off_51418, 0, (char *)&dword_0 + 3);
}

id sub_AF90(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_AF9C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  v10[0] = a2;
  id v7 = a2;
  long long v8 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4);
  v10[1] = v8;
  long long v9 = +[NSArray arrayWithObjects:v10 count:2];
  [v6 addObject:v9];
}

id MapsMap(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    id v7 = (char *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      long long v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i), &i[v9]);
          if (v12) {
            objc_msgSend(v5, "addObject:", v12, (void)v15);
          }
        }
        long long v8 = (char *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v9 += (uint64_t)i;
      }
      while (v8);
    }

    id v13 = [v5 copy];
  }
  else
  {
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

id MapsFlatMap(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v3;
    id obj = v3;
    id v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v30;
      p_data = &@"MapsHomeMaxPins".data;
      do
      {
        long long v11 = 0;
        id v23 = v7;
        do
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          v12 = v4[2](v4, *(void *)(*((void *)&v29 + 1) + 8 * (void)v11), v8);
          id v13 = v12;
          if (v12)
          {
            if ([v12 conformsToProtocol:p_data[436]])
            {
              uint64_t v14 = v9;
              id v15 = v13;
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v16)
              {
                id v17 = v16;
                uint64_t v18 = *(void *)v26;
                do
                {
                  for (i = 0; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v26 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    objc_msgSend(v5, "addObject:", *(void *)(*((void *)&v25 + 1) + 8 * i), v22);
                  }
                  id v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
                }
                while (v17);
              }

              uint64_t v9 = v14;
              id v7 = v23;
              p_data = (char **)(@"MapsHomeMaxPins" + 16);
            }
            else
            {
              [v5 addObject:v13];
            }
          }
          ++v8;

          long long v11 = (char *)v11 + 1;
        }
        while (v11 != v7);
        id v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v7);
    }

    id v20 = [v5 copy];
    id v3 = v22;
  }
  else
  {
    id v20 = &__NSArray0__struct;
  }

  return v20;
}

id MapsFilter(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        char v15 = 0;
        if (v4[2](v4, v12, v9 + v11, &v15)) {
          [v5 addObject:v12];
        }
        if (v15) {
          break;
        }
        if (v8 == (id)++v11)
        {
          id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          v9 += v11;
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v13 = [v5 copy];
  }
  else
  {
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

id MapsFindFirst(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = (char *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          char v14 = 0;
          if (v4[2](v4, v11, &i[v8], &v14))
          {
            id v12 = v11;
            goto LABEL_15;
          }
          if (v14) {
            goto LABEL_12;
          }
        }
        id v7 = (char *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        id v12 = 0;
        v8 += (uint64_t)i;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_12:
      id v12 = 0;
    }
LABEL_15:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t MapsAllSatisfies(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    id v6 = (char *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          if (!v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * (void)v10), &v10[v8]))
          {
            uint64_t v11 = 0;
            goto LABEL_12;
          }
          ++v10;
        }
        while (v7 != v10);
        id v7 = (char *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        v8 += (uint64_t)v10;
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 1;
LABEL_12:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id MapsEquals(void *a1, void *a2)
{
  if (a1 == a2) {
    return &dword_0 + 1;
  }
  else {
    return [a1 isEqual:a2];
  }
}

__CFString *MapsStringFromBOOL(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

void sub_E2E8(uint64_t a1)
{
  v2 = *(id **)(a1 + 32);
  id v3 = [v2[5] mapItem];
  uint64_t v4 = [v2 _placeItemFromMapItem:v3 isIntermediate:0];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 32) placeViewController];
  [v7 setPlaceItem:*(void *)(*(void *)(a1 + 32) + 40) updateOriginalContact:0];

  id v8 = [*(id *)(a1 + 32) delegate];
  [v8 siriViewControllerHeightDidChange:*(void *)(a1 + 32) pinTopOfSnippet:1];
}

uint64_t sub_E784(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

void sub_ECC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  long long v13 = sub_EDB4;
  long long v14 = &unk_3D150;
  id v7 = v5;
  id v15 = v7;
  id v8 = v6;
  id v16 = v8;
  uint64_t v9 = objc_retainBlock(&v11);
  uint64_t v10 = *(void **)(a1 + 32);
  if (v8) {
    objc_msgSend(v10, "openURL:bundleIdentifier:completionHandler:", v7, v8, v9, v11, v12, v13, v14, v15);
  }
  else {
    objc_msgSend(v10, "openURL:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
  }
}

void sub_EDB4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    NSLog(@"Failed to open URL %@ to app: %@", *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

UIColor *__cdecl sub_EDEC(id a1)
{
  return +[UIColor labelColor];
}

void sub_10FDC(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)UIImage) initWithData:v3];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = +[NSOperationQueue mainQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_110C4;
  v8[3] = &unk_3D1E8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v6;
  id v7 = v4;
  [v5 addOperationWithBlock:v8];
}

id sub_110C4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "setImage:");
  }
  v2 = *(void **)(a1 + 40);

  return [v2 _updateImageViewVisibility];
}

void sub_114F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1151C(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained(v1);
    [v2 _updateSubviews];

    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:WeakRetained[1]];

    id v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

void sub_11E80(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoading:0];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 siriSnippetViewControllerViewDidLoad:*(void *)(a1 + 32)];
}

id sub_12524(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v1 = +[NSArray arrayWithObjects:&v4 count:1];
  id v2 = +[MKMapItem urlForMapItems:v1 options:0];

  return v2;
}

id sub_12668(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapItemSnippet];
  uint64_t v7 = MKLaunchOptionsSelectedIndexKey;
  id v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) selectedMapItemIndex]);
  id v8 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = [v2 urlForMapItemsWithLaunchOptions:v4];

  return v5;
}

id sub_128C0(void *a1)
{
  uint64_t v2 = a1[5];
  v10[0] = a1[4];
  v10[1] = v2;
  id v3 = +[NSArray arrayWithObjects:v10 count:2];
  uint64_t v4 = a1[6];
  id v8 = MKLaunchOptionsDirectionsModeKey;
  uint64_t v9 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  uint64_t v6 = +[MKMapItem urlForMapItems:v3 options:v5];

  return v6;
}

void sub_134A8(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 listView:*(void *)(a1 + 32) didChooseMapItem:v6 accessoryButtonTapped:1];
  }
}

void sub_13944(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v2 = (void *)qword_51B78;
  qword_51B78 = (uint64_t)v1;

  [(id)qword_51B78 setTimeStyle:1];
  id v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)qword_51B78 setLocale:v3];
}

void sub_13A64(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v2 = (void *)qword_51B88;
  qword_51B88 = (uint64_t)v1;

  [(id)qword_51B88 setTimeStyle:1];
  id v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)qword_51B88 setLocale:v3];
}

void sub_13B70(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v2 = (void *)qword_51B98;
  qword_51B98 = (uint64_t)v1;

  id v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)qword_51B98 setLocale:v3];
}

void sub_13C70(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v2 = (void *)qword_51BA8;
  qword_51BA8 = (uint64_t)v1;

  id v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)qword_51BA8 setLocale:v3];
}

void sub_13D70(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v2 = (void *)qword_51BB8;
  qword_51BB8 = (uint64_t)v1;

  id v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)qword_51BB8 setLocale:v3];
}

void sub_13E70(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v2 = (void *)qword_51BC8;
  qword_51BC8 = (uint64_t)v1;

  id v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)qword_51BC8 setLocale:v3];
}

void sub_13F70(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v2 = (void *)qword_51BD8;
  qword_51BD8 = (uint64_t)v1;

  id v3 = +[NSLocale autoupdatingCurrentLocale];
  [(id)qword_51BD8 setLocale:v3];
}

void sub_14048(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateComponentsFormatter);
  uint64_t v2 = (void *)qword_51BE8;
  qword_51BE8 = (uint64_t)v1;

  [(id)qword_51BE8 setUnitsStyle:2];
  [(id)qword_51BE8 setAllowedUnits:112];
  [(id)qword_51BE8 setMaximumUnitCount:2];
  id v3 = (void *)qword_51BE8;

  [v3 setCollapsesLargestUnit:1];
}

void sub_14120(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateComponentsFormatter);
  uint64_t v2 = (void *)qword_51BF8;
  qword_51BF8 = (uint64_t)v1;

  [(id)qword_51BF8 setUnitsStyle:3];
  [(id)qword_51BF8 setAllowedUnits:112];
  [(id)qword_51BF8 setMaximumUnitCount:2];
  id v3 = (void *)qword_51BF8;

  [v3 setCollapsesLargestUnit:1];
}

id MapsPerformSelector(void *a1, const char *a2)
{
  return [a1 performSelector:a2];
}

id MapsPerformSelectorWithObject(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 performSelector:a2 withObject:a3];
}

id MapsPerformSelectorWithObjectWithObject(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 performSelector:a2 withObject:a3 withObject:a4];
}

id MapsPerformNonownedReturnSelector(void *a1, const char *a2)
{
  return [a1 performSelector:a2];
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLLocationCoordinate2DGetDistanceFrom()
{
  return _CLLocationCoordinate2DGetDistanceFrom();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MKMapPoint v3 = _MKMapPointForCoordinate(coordinate);
  double y = v3.y;
  double x = v3.x;
  result.double y = y;
  result.double x = x;
  return result;
}

double MKMapPointsPerMeterAtLatitude(CLLocationDegrees latitude)
{
  return _MKMapPointsPerMeterAtLatitude(latitude);
}

uint64_t MKMapRectBoundingMapPoints()
{
  return _MKMapRectBoundingMapPoints();
}

CLLocationDistance MKMetersBetweenMapPoints(MKMapPoint a, MKMapPoint b)
{
  return _MKMetersBetweenMapPoints(a, b);
}

uint64_t MapsFeature_IsEnabled_DrivingMultiWaypointRoutes()
{
  return _MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
}

uint64_t MapsFeature_IsEnabled_Maps182()
{
  return _MapsFeature_IsEnabled_Maps182();
}

uint64_t MapsFeature_IsEnabled_Maps420()
{
  return _MapsFeature_IsEnabled_Maps420();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SiriLanguageIsRTL()
{
  return _SiriLanguageIsRTL();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void objc_addLoadImageFunc(objc_func_loadImage func)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__addressFormattedAsShortenedAddress(void *a1, const char *a2, ...)
{
  return [a1 _addressFormattedAsShortenedAddress];
}

id objc_msgSend__checkAllItemsHaveSameTitle(void *a1, const char *a2, ...)
{
  return [a1 _checkAllItemsHaveSameTitle];
}

id objc_msgSend__coordinate(void *a1, const char *a2, ...)
{
  return [a1 _coordinate];
}

id objc_msgSend__detourInfo(void *a1, const char *a2, ...)
{
  return [a1 _detourInfo];
}

id objc_msgSend__distanceString(void *a1, const char *a2, ...)
{
  return [a1 _distanceString];
}

id objc_msgSend__firstLocalizedCategoryName(void *a1, const char *a2, ...)
{
  return [a1 _firstLocalizedCategoryName];
}

id objc_msgSend__geoMapItem(void *a1, const char *a2, ...)
{
  return [a1 _geoMapItem];
}

id objc_msgSend__hasTransit(void *a1, const char *a2, ...)
{
  return [a1 _hasTransit];
}

id objc_msgSend__hasTransitDisplayName(void *a1, const char *a2, ...)
{
  return [a1 _hasTransitDisplayName];
}

id objc_msgSend__hasUserRatingScore(void *a1, const char *a2, ...)
{
  return [a1 _hasUserRatingScore];
}

id objc_msgSend__listSnippetView(void *a1, const char *a2, ...)
{
  return [a1 _listSnippetView];
}

id objc_msgSend__loadMapSnippetView(void *a1, const char *a2, ...)
{
  return [a1 _loadMapSnippetView];
}

id objc_msgSend__majorFont(void *a1, const char *a2, ...)
{
  return [a1 _majorFont];
}

id objc_msgSend__mapSnippetView(void *a1, const char *a2, ...)
{
  return [a1 _mapSnippetView];
}

id objc_msgSend__minorFont(void *a1, const char *a2, ...)
{
  return [a1 _minorFont];
}

id objc_msgSend__newMapOverlayView(void *a1, const char *a2, ...)
{
  return [a1 _newMapOverlayView];
}

id objc_msgSend__newMapView(void *a1, const char *a2, ...)
{
  return [a1 _newMapView];
}

id objc_msgSend__newReservationView(void *a1, const char *a2, ...)
{
  return [a1 _newReservationView];
}

id objc_msgSend__newResultView(void *a1, const char *a2, ...)
{
  return [a1 _newResultView];
}

id objc_msgSend__openTableBundleId(void *a1, const char *a2, ...)
{
  return [a1 _openTableBundleId];
}

id objc_msgSend__perceivedSize(void *a1, const char *a2, ...)
{
  return [a1 _perceivedSize];
}

id objc_msgSend__photos(void *a1, const char *a2, ...)
{
  return [a1 _photos];
}

id objc_msgSend__placeDataAsData(void *a1, const char *a2, ...)
{
  return [a1 _placeDataAsData];
}

id objc_msgSend__registerURLDelegate(void *a1, const char *a2, ...)
{
  return [a1 _registerURLDelegate];
}

id objc_msgSend__setupConstraints(void *a1, const char *a2, ...)
{
  return [a1 _setupConstraints];
}

id objc_msgSend__setupCustomFeatureForMapItem(void *a1, const char *a2, ...)
{
  return [a1 _setupCustomFeatureForMapItem];
}

id objc_msgSend__setupCustomFeatureForParkedCar(void *a1, const char *a2, ...)
{
  return [a1 _setupCustomFeatureForParkedCar];
}

id objc_msgSend__setupCustomFeatureStore(void *a1, const char *a2, ...)
{
  return [a1 _setupCustomFeatureStore];
}

id objc_msgSend__showOpenStateLabel(void *a1, const char *a2, ...)
{
  return [a1 _showOpenStateLabel];
}

id objc_msgSend__styleAttributes(void *a1, const char *a2, ...)
{
  return [a1 _styleAttributes];
}

id objc_msgSend__transitDisplayName(void *a1, const char *a2, ...)
{
  return [a1 _transitDisplayName];
}

id objc_msgSend__unitLength(void *a1, const char *a2, ...)
{
  return [a1 _unitLength];
}

id objc_msgSend__unregisterURLDelegate(void *a1, const char *a2, ...)
{
  return [a1 _unregisterURLDelegate];
}

id objc_msgSend__updateDetailLine1(void *a1, const char *a2, ...)
{
  return [a1 _updateDetailLine1];
}

id objc_msgSend__updateHorizontalCompressionResistanceForLabels(void *a1, const char *a2, ...)
{
  return [a1 _updateHorizontalCompressionResistanceForLabels];
}

id objc_msgSend__updateImage(void *a1, const char *a2, ...)
{
  return [a1 _updateImage];
}

id objc_msgSend__updateImageViewVisibility(void *a1, const char *a2, ...)
{
  return [a1 _updateImageViewVisibility];
}

id objc_msgSend__updateSubviews(void *a1, const char *a2, ...)
{
  return [a1 _updateSubviews];
}

id objc_msgSend_analyticsUITarget(void *a1, const char *a2, ...)
{
  return [a1 analyticsUITarget];
}

id objc_msgSend_annotations(void *a1, const char *a2, ...)
{
  return [a1 annotations];
}

id objc_msgSend_appearing(void *a1, const char *a2, ...)
{
  return [a1 appearing];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assistantLanguageIsRTL(void *a1, const char *a2, ...)
{
  return [a1 assistantLanguageIsRTL];
}

id objc_msgSend_assistantUILocale(void *a1, const char *a2, ...)
{
  return [a1 assistantUILocale];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return [a1 attributedText];
}

id objc_msgSend_attributionFrame(void *a1, const char *a2, ...)
{
  return [a1 attributionFrame];
}

id objc_msgSend_attributions(void *a1, const char *a2, ...)
{
  return [a1 attributions];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return [a1 backgroundView];
}

id objc_msgSend_blockOnButtonTappedForSARResult(void *a1, const char *a2, ...)
{
  return [a1 blockOnButtonTappedForSARResult];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_centimeters(void *a1, const char *a2, ...)
{
  return [a1 centimeters];
}

id objc_msgSend_chainResultSet(void *a1, const char *a2, ...)
{
  return [a1 chainResultSet];
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return [a1 city];
}

id objc_msgSend_clRepresentation(void *a1, const char *a2, ...)
{
  return [a1 clRepresentation];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commands(void *a1, const char *a2, ...)
{
  return [a1 commands];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return [a1 country];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHeight(void *a1, const char *a2, ...)
{
  return [a1 currentHeight];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_desiredHeight(void *a1, const char *a2, ...)
{
  return [a1 desiredHeight];
}

id objc_msgSend_detail(void *a1, const char *a2, ...)
{
  return [a1 detail];
}

id objc_msgSend_detailType(void *a1, const char *a2, ...)
{
  return [a1 detailType];
}

id objc_msgSend_detourTime(void *a1, const char *a2, ...)
{
  return [a1 detourTime];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disambiguationSnippet(void *a1, const char *a2, ...)
{
  return [a1 disambiguationSnippet];
}

id objc_msgSend_displayFormat(void *a1, const char *a2, ...)
{
  return [a1 displayFormat];
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return [a1 distance];
}

id objc_msgSend_distanceInMeters(void *a1, const char *a2, ...)
{
  return [a1 distanceInMeters];
}

id objc_msgSend_distanceInMiles(void *a1, const char *a2, ...)
{
  return [a1 distanceInMiles];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_donateActivityCommand(void *a1, const char *a2, ...)
{
  return [a1 donateActivityCommand];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_extSessionGuid(void *a1, const char *a2, ...)
{
  return [a1 extSessionGuid];
}

id objc_msgSend_extSessionGuidCreatedTimestamp(void *a1, const char *a2, ...)
{
  return [a1 extSessionGuidCreatedTimestamp];
}

id objc_msgSend_fallbackDistance(void *a1, const char *a2, ...)
{
  return [a1 fallbackDistance];
}

id objc_msgSend_feet(void *a1, const char *a2, ...)
{
  return [a1 feet];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_geoMapItemOpeningHourOptions(void *a1, const char *a2, ...)
{
  return [a1 geoMapItemOpeningHourOptions];
}

id objc_msgSend_hasAttributes(void *a1, const char *a2, ...)
{
  return [a1 hasAttributes];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hoursStateLabelColor(void *a1, const char *a2, ...)
{
  return [a1 hoursStateLabelColor];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isBusinessLocation(void *a1, const char *a2, ...)
{
  return [a1 isBusinessLocation];
}

id objc_msgSend_isCurrentLocation(void *a1, const char *a2, ...)
{
  return [a1 isCurrentLocation];
}

id objc_msgSend_isDisplayForSAR(void *a1, const char *a2, ...)
{
  return [a1 isDisplayForSAR];
}

id objc_msgSend_isImperialUnit(void *a1, const char *a2, ...)
{
  return [a1 isImperialUnit];
}

id objc_msgSend_isIntermediateMapItem(void *a1, const char *a2, ...)
{
  return [a1 isIntermediateMapItem];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isLabelPOI(void *a1, const char *a2, ...)
{
  return [a1 isLabelPOI];
}

id objc_msgSend_isLocationDetailPreferred(void *a1, const char *a2, ...)
{
  return [a1 isLocationDetailPreferred];
}

id objc_msgSend_isMetricUnit(void *a1, const char *a2, ...)
{
  return [a1 isMetricUnit];
}

id objc_msgSend_isParkingLocation(void *a1, const char *a2, ...)
{
  return [a1 isParkingLocation];
}

id objc_msgSend_isRegionCity(void *a1, const char *a2, ...)
{
  return [a1 isRegionCity];
}

id objc_msgSend_isRegionCountry(void *a1, const char *a2, ...)
{
  return [a1 isRegionCountry];
}

id objc_msgSend_isRegionCounty(void *a1, const char *a2, ...)
{
  return [a1 isRegionCounty];
}

id objc_msgSend_isRegionState(void *a1, const char *a2, ...)
{
  return [a1 isRegionState];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_isWithinMaxDistanceToShow(void *a1, const char *a2, ...)
{
  return [a1 isWithinMaxDistanceToShow];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_keyline(void *a1, const char *a2, ...)
{
  return [a1 keyline];
}

id objc_msgSend_kilometers(void *a1, const char *a2, ...)
{
  return [a1 kilometers];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_locManager(void *a1, const char *a2, ...)
{
  return [a1 locManager];
}

id objc_msgSend_localizedDistanceString(void *a1, const char *a2, ...)
{
  return [a1 localizedDistanceString];
}

id objc_msgSend_localizedOperatingHours(void *a1, const char *a2, ...)
{
  return [a1 localizedOperatingHours];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationActivityMetaData(void *a1, const char *a2, ...)
{
  return [a1 locationActivityMetaData];
}

id objc_msgSend_locationDetailLabel(void *a1, const char *a2, ...)
{
  return [a1 locationDetailLabel];
}

id objc_msgSend_locationName(void *a1, const char *a2, ...)
{
  return [a1 locationName];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeReservationPunchOut(void *a1, const char *a2, ...)
{
  return [a1 makeReservationPunchOut];
}

id objc_msgSend_makeReservationPunchOuts(void *a1, const char *a2, ...)
{
  return [a1 makeReservationPunchOuts];
}

id objc_msgSend_mapItem(void *a1, const char *a2, ...)
{
  return [a1 mapItem];
}

id objc_msgSend_mapItemForCurrentLocation(void *a1, const char *a2, ...)
{
  return [a1 mapItemForCurrentLocation];
}

id objc_msgSend_mapItemSnippet(void *a1, const char *a2, ...)
{
  return [a1 mapItemSnippet];
}

id objc_msgSend_mapItems(void *a1, const char *a2, ...)
{
  return [a1 mapItems];
}

id objc_msgSend_markerStyleAttributes(void *a1, const char *a2, ...)
{
  return [a1 markerStyleAttributes];
}

id objc_msgSend_meters(void *a1, const char *a2, ...)
{
  return [a1 meters];
}

id objc_msgSend_miles(void *a1, const char *a2, ...)
{
  return [a1 miles];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsAttribution(void *a1, const char *a2, ...)
{
  return [a1 needsAttribution];
}

id objc_msgSend_needsLocationManager(void *a1, const char *a2, ...)
{
  return [a1 needsLocationManager];
}

id objc_msgSend_openTableAppPunchOut(void *a1, const char *a2, ...)
{
  return [a1 openTableAppPunchOut];
}

id objc_msgSend_openURLDelegate(void *a1, const char *a2, ...)
{
  return [a1 openURLDelegate];
}

id objc_msgSend_openURLWithSnippetMapItemsAndSelectedMapItem(void *a1, const char *a2, ...)
{
  return [a1 openURLWithSnippetMapItemsAndSelectedMapItem];
}

id objc_msgSend_openings(void *a1, const char *a2, ...)
{
  return [a1 openings];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_place(void *a1, const char *a2, ...)
{
  return [a1 place];
}

id objc_msgSend_placeData2(void *a1, const char *a2, ...)
{
  return [a1 placeData2];
}

id objc_msgSend_placeViewController(void *a1, const char *a2, ...)
{
  return [a1 placeViewController];
}

id objc_msgSend_postalCode(void *a1, const char *a2, ...)
{
  return [a1 postalCode];
}

id objc_msgSend_preferredHeight(void *a1, const char *a2, ...)
{
  return [a1 preferredHeight];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return [a1 rangeValue];
}

id objc_msgSend_referenceLocation(void *a1, const char *a2, ...)
{
  return [a1 referenceLocation];
}

id objc_msgSend_regionOfInterestRadiusInMiles(void *a1, const char *a2, ...)
{
  return [a1 regionOfInterestRadiusInMiles];
}

id objc_msgSend_regionType(void *a1, const char *a2, ...)
{
  return [a1 regionType];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reservationDelegate(void *a1, const char *a2, ...)
{
  return [a1 reservationDelegate];
}

id objc_msgSend_restaurantInfo(void *a1, const char *a2, ...)
{
  return [a1 restaurantInfo];
}

id objc_msgSend_resultDetourInfoData(void *a1, const char *a2, ...)
{
  return [a1 resultDetourInfoData];
}

id objc_msgSend_resultView(void *a1, const char *a2, ...)
{
  return [a1 resultView];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_searchAlongRoute(void *a1, const char *a2, ...)
{
  return [a1 searchAlongRoute];
}

id objc_msgSend_searchRegionCenter(void *a1, const char *a2, ...)
{
  return [a1 searchRegionCenter];
}

id objc_msgSend_secondaryColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryColor];
}

id objc_msgSend_selectedItemIndex(void *a1, const char *a2, ...)
{
  return [a1 selectedItemIndex];
}

id objc_msgSend_selectedLocalSearchMapItem(void *a1, const char *a2, ...)
{
  return [a1 selectedLocalSearchMapItem];
}

id objc_msgSend_selectedMapItemIndex(void *a1, const char *a2, ...)
{
  return [a1 selectedMapItemIndex];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLocationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedLocationManager];
}

id objc_msgSend_sharedPlatform(void *a1, const char *a2, ...)
{
  return [a1 sharedPlatform];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_shouldDisplayLocationDetail(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayLocationDetail];
}

id objc_msgSend_showsBalloonCallout(void *a1, const char *a2, ...)
{
  return [a1 showsBalloonCallout];
}

id objc_msgSend_snippet(void *a1, const char *a2, ...)
{
  return [a1 snippet];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocation];
}

id objc_msgSend_stateCode(void *a1, const char *a2, ...)
{
  return [a1 stateCode];
}

id objc_msgSend_stateOrProvince(void *a1, const char *a2, ...)
{
  return [a1 stateOrProvince];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_street(void *a1, const char *a2, ...)
{
  return [a1 street];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_tertiaryColor(void *a1, const char *a2, ...)
{
  return [a1 tertiaryColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_thoroughfare(void *a1, const char *a2, ...)
{
  return [a1 thoroughfare];
}

id objc_msgSend_timeComponentsForOpenings(void *a1, const char *a2, ...)
{
  return [a1 timeComponentsForOpenings];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeSlot(void *a1, const char *a2, ...)
{
  return [a1 timeSlot];
}

id objc_msgSend_timeZoneId(void *a1, const char *a2, ...)
{
  return [a1 timeZoneId];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return [a1 unit];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updatePlaceItem(void *a1, const char *a2, ...)
{
  return [a1 updatePlaceItem];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlForMapAttribution(void *a1, const char *a2, ...)
{
  return [a1 urlForMapAttribution];
}

id objc_msgSend_useModernPlacecard(void *a1, const char *a2, ...)
{
  return [a1 useModernPlacecard];
}

id objc_msgSend_userCurrentLocation(void *a1, const char *a2, ...)
{
  return [a1 userCurrentLocation];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userLocation(void *a1, const char *a2, ...)
{
  return [a1 userLocation];
}

id objc_msgSend_usesFixedLocation(void *a1, const char *a2, ...)
{
  return [a1 usesFixedLocation];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}