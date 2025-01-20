@interface SubmitTestFlightFeedbackTask
- (void)main;
@end

@implementation SubmitTestFlightFeedbackTask

- (void)main
{
  if (self)
  {
    v3 = self->super._entity;
    v4 = sub_100233690((_TtC9appstored6LogKey *)v3);

    uint64_t v5 = objc_opt_new();
    v6 = self->super._entity;
    v7 = sub_1002333F4(v6);
    id v8 = [v7 unsignedLongLongValue];
    if (v5)
    {
      *(unsigned char *)(v5 + 64) |= 2u;
      *(void *)(v5 + 16) = v8;
    }

    id v9 = [v4 timestamp];
    if (v5)
    {
      *(unsigned char *)(v5 + 64) |= 4u;
      *(void *)(v5 + 24) = v9;
    }
    v10 = objc_opt_new();
    v11 = [v4 email];
    sub_100262660((uint64_t)v10, v11);

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v12 = self->super._entity;
    v13 = sub_100233A90((_TtC9appstored6LogKey *)v12);

    id v14 = [v13 countByEnumeratingWithState:&v74 objects:v78 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v75;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v75 != v16) {
            objc_enumerationMutation(v13);
          }
          sub_100261F7C((uint64_t)v10, *(void **)(*((void *)&v74 + 1) + 8 * i));
        }
        id v15 = [v13 countByEnumeratingWithState:&v74 objects:v78 count:16];
      }
      while (v15);
    }

    v18 = [v4 comments];
    sub_100262678((uint64_t)v10, v18);

    v19 = [v4 incidentID];
    sub_100262690((uint64_t)v10, v19);

    sub_100356430(v5, v10);
    uint64_t v20 = objc_opt_new();
    v21 = self->super._entity;
    v22 = sub_100233AEC(v21);
    id v23 = [v22 unsignedLongLongValue];
    if (v20)
    {
      *(unsigned char *)(v20 + 72) |= 1u;
      *(void *)(v20 + 8) = v23;
    }

    v24 = self->super._entity;
    v25 = v24;
    if (v24) {
      LOBYTE(v24) = sub_10026E7EC(v24, @"is_app_clip");
    }
    if (v20)
    {
      *(unsigned char *)(v20 + 72) |= 8u;
      *(unsigned char *)(v20 + 68) = (_BYTE)v24;
    }

    v26 = self->super._entity;
    v27 = sub_100233474(v26);

    if (v27) {
      sub_100427AD0(v20, v27);
    }
    v70 = v27;
    v28 = self->super._entity;
    v29 = sub_1002334AC((_TtC9appstored6LogKey *)v28);

    v30 = [v29 bundleID];
    sub_100427A88(v20, v30);

    v31 = [v29 bundleVersion];
    sub_100427AB8(v20, v31);

    v32 = [v29 shortVersion];
    sub_100427AA0(v20, v32);

    id v33 = [v29 platform];
    if (v20)
    {
      if (v33 == (id)2) {
        int v34 = 3;
      }
      else {
        int v34 = 1;
      }
      if (v33 == (id)1) {
        int v34 = 2;
      }
      *(unsigned char *)(v20 + 72) |= 4u;
      *(_DWORD *)(v20 + 64) = v34;
      id v35 = [v4 appUptime];
      *(unsigned char *)(v20 + 72) |= 2u;
      *(void *)(v20 + 16) = v35;
    }
    else
    {
      [v4 appUptime];
    }
    sub_100356448(v5, (void *)v20);
    uint64_t v36 = objc_opt_new();
    v37 = [v4 deviceType];
    sub_1003ADD2C(v36, v37);

    v38 = [v4 osVersion];
    sub_1003ADD44(v36, v38);

    v39 = [v4 architecture];
    sub_1003ADD5C(v36, v39);

    v40 = [v4 locale];
    sub_1003ADD8C(v36, v40);

    v41 = [v4 timeZone];
    sub_1003ADDA4(v36, v41);

    v42 = [v4 carrier];
    sub_1003ADDBC(v36, v42);

    v43 = [v4 cellularNetworkType];
    sub_1003ADDD4(v36, v43);

    id v44 = [v4 networkConnectionType];
    if ([v44 isEqualToString:@"WI_FI"])
    {
      int v45 = 0;
    }
    else if ([v44 isEqualToString:@"MOBILE_DATA"])
    {
      int v45 = 1;
    }
    else if ([v44 isEqualToString:@"WIRE"])
    {
      int v45 = 2;
    }
    else if ([v44 isEqualToString:@"NONE"])
    {
      int v45 = 3;
    }
    else
    {
      int v45 = 0;
    }

    if (v36)
    {
      *(unsigned char *)(v36 + 104) |= 2u;
      *(_DWORD *)(v36 + 40) = v45;

      unsigned int v46 = [v4 batteryPercentage];
      *(unsigned char *)(v36 + 104) |= 1u;
      *(_DWORD *)(v36 + 16) = v46;
    }
    else
    {

      [v4 batteryPercentage];
    }
    if (+[AMSDevice deviceIsiPod])
    {
      int v47 = 2;
    }
    else if (+[AMSDevice deviceIsiPad])
    {
      int v47 = 3;
    }
    else if (+[AMSDevice deviceIsAppleTV])
    {
      int v47 = 4;
    }
    else if (+[AMSDevice deviceIsAppleWatch])
    {
      int v47 = 5;
    }
    else if (+[AMSDevice deviceIsMac])
    {
      int v47 = 6;
    }
    else
    {
      int v47 = 1;
    }
    if (v36)
    {
      *(unsigned char *)(v36 + 104) |= 4u;
      *(_DWORD *)(v36 + 44) = v47;
      *(unsigned char *)(v36 + 104) |= 8u;
      *(_DWORD *)(v36 + 48) = 1;
    }
    uint64_t v48 = objc_opt_new();
    unsigned int v49 = [v4 screenWidth];
    if (v48)
    {
      *(unsigned char *)(v48 + 16) |= 2u;
      *(_DWORD *)(v48 + 12) = v49;
      unsigned int v50 = [v4 screenHeight];
      *(unsigned char *)(v48 + 16) |= 1u;
      *(_DWORD *)(v48 + 8) = v50;
    }
    else
    {
      [v4 screenHeight];
    }
    sub_1003ADD74(v36, (void *)v48);
    uint64_t v51 = objc_opt_new();
    id v52 = [v4 diskAvailable];
    if (v51)
    {
      *(unsigned char *)(v51 + 24) |= 1u;
      *(void *)(v51 + 8) = v52;
      id v53 = [v4 diskTotal];
      *(unsigned char *)(v51 + 24) |= 2u;
      *(void *)(v51 + 16) = v53;
    }
    else
    {
      [v4 diskTotal];
    }
    sub_1003ADDEC(v36, (void *)v51);
    sub_100356460(v5, (void *)v36);
    uint64_t v54 = [v4 pairedWatchOSVersion];
    if (v54)
    {
      v55 = (void *)v54;
      v56 = [v4 pairedWatchModel];

      if (v56)
      {
        v57 = objc_opt_new();
        v58 = [v4 pairedWatchModel];
        sub_100376AFC((uint64_t)v57, v58);

        v59 = [v4 pairedWatchOSVersion];
        sub_100376B14((uint64_t)v57, v59);

        sub_100356478(v5, v57);
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  v60 = sub_10030B11C();
  id v73 = 0;
  v61 = sub_10030B9EC((uint64_t)v60, @"testflight-visual-feedback/upload-feedback-url", &v73);
  id v62 = v73;

  if (v62)
  {
    id v63 = +[NSString stringWithFormat:@"Failed to find URL for feedback upload: %@", v62];
    v64 = ASDErrorWithDescription();
    [(Task *)self completeWithError:v64];
    v65 = v61;
  }
  else
  {
    v65 = sub_10031756C((id *)&self->super.super.super.super.isa, v61);

    v66 = [(id)v5 data];
    id v72 = 0;
    v64 = sub_10031701C((_TtC9appstored6LogKey **)self, 4, v65, v66, &v72);
    id v63 = v72;

    if (v63)
    {
      v67 = ASDErrorWithSafeUserInfo();
      [(Task *)self completeWithError:v67];
    }
    else
    {
      id v68 = v64;
      v64 = v68;
      if (self)
      {
        if ([v68 responseStatusCode] == (id)200)
        {
          [(Task *)self completeWithSuccess];
        }
        else
        {
          [v64 responseStatusCode];
          v69 = ASDErrorWithDescription();
          [(Task *)self completeWithError:v69];
        }
      }

      id v63 = 0;
    }
  }
}

@end