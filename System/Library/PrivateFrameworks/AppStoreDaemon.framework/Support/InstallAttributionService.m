@interface InstallAttributionService
- (void)addInstallAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4;
- (void)addInstallWebAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4;
- (void)endAdImpressionWithConfig:(id)a3 completionHandler:(id)a4;
- (void)registerPingbackForApp:(id)a3 completionHandler:(id)a4;
- (void)startAdImpressionWithConfig:(id)a3 completionHandler:(id)a4;
- (void)startGhostFetchTaskWithCompletionHandler:(id)a3;
- (void)startPingbackTaskWithCompletionHandler:(id)a3;
- (void)updateConversionValueForApp:(id)a3 conversionValue:(id)a4 completionHandler:(id)a5;
- (void)updatePostbackConversionValuesForApp:(id)a3 fineConversionValue:(id)a4 coarseConversionValue:(id)a5 completionHandler:(id)a6;
- (void)updatePostbackConversionValuesForApp:(id)a3 fineConversionValue:(id)a4 coarseConversionValue:(id)a5 lockWindow:(BOOL)a6 completionHandler:(id)a7;
- (void)validateImpression:(id)a3 withFidelityType:(id)a4 completionHandler:(id)a5;
- (void)validateWebAdImpressionResponseProperties:(id)a3 completionHandler:(id)a4;
@end

@implementation InstallAttributionService

- (void)startAdImpressionWithConfig:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 sourceAppBundleId];
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 138543362;
    v47 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Start impression called from source app with bundle id:%{public}@", (uint8_t *)&v46, 0xCu);
  }

  v9 = [v5 fidelityType];
  unsigned int v10 = [v9 intValue];

  if (!v10)
  {
    uint64_t v12 = objc_opt_new();
    v21 = [v5 appAdamId];
    sub_100263BD8(v12, v21);

    v22 = [v5 adNetworkId];
    sub_100263BE8(v12, v22);

    v23 = [v5 impressionId];
    sub_100263BF8(v12, v23);

    v24 = [v5 sourceAppAdamId];
    sub_100263C08(v12, v24);

    v25 = [v5 timestamp];
    sub_100263C18(v12, v25);

    v26 = +[NSDate now];
    [v26 timeIntervalSince1970];
    v28 = +[NSNumber numberWithInteger:(uint64_t)(v27 * 1000.0)];
    sub_100263C28(v12, v28);

    v29 = [v5 attributionSignature];
    sub_100263C38(v12, v29);

    v30 = [v5 version];
    sub_100263C48(v12, v30);

    v31 = [v5 sourceAppBundleId];
    sub_100263C58(v12, v31);

    v32 = [v5 fidelityType];
    id v33 = [v32 integerValue];
    if (v12)
    {
      *(void *)(v12 + 96) = v33;

      uint64_t v34 = [v5 processName];
      v35 = (void *)v34;
      if (v34) {
        v36 = (__CFString *)v34;
      }
      else {
        v36 = @"(null)";
      }
      sub_100263C68(v12, v36);

      id v37 = *(id *)(v12 + 80);
      if (v37)
      {
        v38 = v37;
        uint64_t v39 = ASDInstallAttributionVersionCreateFromString();

        if (v39 >= 400)
        {
          v40 = [v5 sourceIdentifier];
          id v41 = [v40 integerValue];
          uint64_t v42 = 32;
          goto LABEL_22;
        }
      }
    }
    else
    {

      uint64_t v43 = [v5 processName];
      v44 = (void *)v43;
      if (v43) {
        v45 = (__CFString *)v43;
      }
      else {
        v45 = @"(null)";
      }
      sub_100263C68(0, v45);
    }
    v40 = [v5 campaignId];
    id v41 = [v40 integerValue];
    if (!v12)
    {
LABEL_23:

      v18 = sub_1003C44E0();
      sub_1003C4DDC((uint64_t)v18, (void *)v12, v6);
      goto LABEL_24;
    }
    uint64_t v42 = 24;
LABEL_22:
    *(void *)(v12 + v42) = v41;
    goto LABEL_23;
  }
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v46 = 138543362;
    v47 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "high fidelity impressions not allowed:%{public}@", (uint8_t *)&v46, 0xCu);
  }

  uint64_t v12 = ASDErrorWithDescription();
  if (v6) {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, v12);
  }
  v13 = +[SkannerEvent resultTypeFinalized];
  v14 = [v5 adNetworkId];
  v15 = +[SkannerEvent adTypeApp];
  v16 = +[SkannerEvent interactionTypeView];
  v17 = [v5 version];
  v18 = +[SkannerEvent impressionWithResult:v13 adNetworkID:v14 adType:v15 interactionType:v16 version:v17 error:v12];

  v19 = +[SkannerCoordinator sharedInstance];
  v20 = [v5 appAdamId];
  objc_msgSend(v19, "logEvent:forAdvertisedAppAdamID:", v18, objc_msgSend(v20, "longLongValue"));

LABEL_24:
}

- (void)endAdImpressionWithConfig:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v5 sourceAppBundleId];
    int v47 = 138543362;
    v48 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "End impression called from source app with bundle id:%{public}@", (uint8_t *)&v47, 0xCu);
  }
  v9 = [v5 fidelityType];
  unsigned int v10 = [v9 intValue];

  if (!v10)
  {
    uint64_t v12 = objc_opt_new();
    v21 = [v5 appAdamId];
    sub_100263BD8(v12, v21);

    v22 = [v5 adNetworkId];
    sub_100263BE8(v12, v22);

    v23 = [v5 impressionId];
    sub_100263BF8(v12, v23);

    v24 = [v5 sourceAppAdamId];
    sub_100263C08(v12, v24);

    v25 = [v5 timestamp];
    sub_100263C18(v12, v25);

    v26 = +[NSDate now];
    [v26 timeIntervalSince1970];
    v28 = +[NSNumber numberWithInteger:(uint64_t)(v27 * 1000.0)];
    sub_100263C28(v12, v28);

    v29 = [v5 attributionSignature];
    sub_100263C38(v12, v29);

    v30 = [v5 version];
    sub_100263C48(v12, v30);

    v31 = [v5 sourceAppBundleId];
    sub_100263C58(v12, v31);

    v32 = [v5 fidelityType];
    id v33 = [v32 integerValue];
    if (v12)
    {
      *(void *)(v12 + 96) = v33;

      uint64_t v34 = [v5 processName];
      v35 = (void *)v34;
      if (v34) {
        v36 = (__CFString *)v34;
      }
      else {
        v36 = @"(null)";
      }
      sub_100263C68(v12, v36);

      id v37 = *(id *)(v12 + 80);
      if (v37)
      {
        v38 = v37;
        uint64_t v39 = ASDInstallAttributionVersionCreateFromString();

        if (v39 >= 400)
        {
          v40 = [v5 sourceIdentifier];
          id v41 = [v40 integerValue];
          uint64_t v42 = 32;
          goto LABEL_22;
        }
      }
    }
    else
    {

      uint64_t v44 = [v5 processName];
      v45 = (void *)v44;
      if (v44) {
        int v46 = (__CFString *)v44;
      }
      else {
        int v46 = @"(null)";
      }
      sub_100263C68(0, v46);
    }
    v40 = [v5 campaignId];
    id v41 = [v40 integerValue];
    if (!v12)
    {
LABEL_23:

      v18 = sub_1003C44E0();
      sub_1003C5F04((uint64_t)v18, (void *)v12, v6);
      goto LABEL_24;
    }
    uint64_t v42 = 24;
LABEL_22:
    *(void *)(v12 + v42) = v41;
    goto LABEL_23;
  }
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v43 = [v5 sourceAppBundleId];
    int v47 = 138543362;
    v48 = v43;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "high fidelity impressions not allowed:%{public}@", (uint8_t *)&v47, 0xCu);
  }
  uint64_t v12 = ASDErrorWithDescription();
  if (v6) {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, v12);
  }
  v13 = +[SkannerEvent resultTypeFinalized];
  v14 = [v5 adNetworkId];
  v15 = +[SkannerEvent adTypeApp];
  v16 = +[SkannerEvent interactionTypeView];
  v17 = [v5 version];
  v18 = +[SkannerEvent impressionWithResult:v13 adNetworkID:v14 adType:v15 interactionType:v16 version:v17 error:v12];

  v19 = +[SkannerCoordinator sharedInstance];
  v20 = [v5 appAdamId];
  objc_msgSend(v19, "logEvent:forAdvertisedAppAdamID:", v18, objc_msgSend(v20, "longLongValue"));

LABEL_24:
}

- (void)startPingbackTaskWithCompletionHandler:(id)a3
{
  v8 = (void (**)(id, void *))a3;
  if ((sub_1003DBC70(self) & 1) == 0)
  {
    v7 = ASDErrorWithDescription();
    if (v8) {
      v8[2](v8, v7);
    }

    goto LABEL_9;
  }
  uint64_t v4 = sub_1003C44E0();
  id v5 = (void *)v4;
  if (v4) {
    sub_1003C47F4(v4);
  }

  id v6 = v8;
  if (v8)
  {
    v8[2](v8, 0);
LABEL_9:
    id v6 = v8;
  }
}

- (void)startGhostFetchTaskWithCompletionHandler:(id)a3
{
  id v6 = a3;
  if (sub_1003DBC70(self))
  {
    sub_1003C44E0();

    uint64_t v4 = v6;
    if (!v6) {
      goto LABEL_8;
    }
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
  else
  {
    id v5 = ASDErrorWithDescription();
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v5);
    }
  }
  uint64_t v4 = v6;
LABEL_8:
}

- (void)registerPingbackForApp:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v9)
  {
    if (sub_1003C4D74())
    {
      v7 = 0;
    }
    else
    {
      v7 = sub_1003DBE98((uint64_t)self, v9);
    }
    v8 = sub_1003C44E0();
    sub_1003CBC60((uint64_t)v8, v9, v7);

    if (v6) {
      v6[2](v6, 0);
    }
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)updateConversionValueForApp:(id)a3 conversionValue:(id)a4 completionHandler:(id)a5
{
}

- (void)updatePostbackConversionValuesForApp:(id)a3 fineConversionValue:(id)a4 coarseConversionValue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (v10 && v11)
  {
    if (sub_1003C4D74())
    {
      v15 = 0;
    }
    else
    {
      v15 = sub_1003DBE98((uint64_t)self, v10);
    }
    v16 = sub_1003C44E0();
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1003DC12C;
    v17[3] = &unk_100521898;
    id v18 = v14;
    sub_1003CC47C((uint64_t)v16, v11, v12, v10, v15, 0, v17);
  }
  else if (v13)
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

- (void)updatePostbackConversionValuesForApp:(id)a3 fineConversionValue:(id)a4 coarseConversionValue:(id)a5 lockWindow:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = v15;
  if (v12 && v13)
  {
    if (sub_1003C4D74())
    {
      v17 = 0;
    }
    else
    {
      v17 = sub_1003DBE98((uint64_t)self, v12);
    }
    id v18 = sub_1003C44E0();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1003DC2A0;
    v19[3] = &unk_100521898;
    id v20 = v16;
    sub_1003CC47C((uint64_t)v18, v13, v14, v12, v17, a6, v19);
  }
  else if (v15)
  {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
}

- (void)addInstallAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4
{
  id v37 = a3;
  id v6 = (void (**)(id, void *))a4;
  v7 = sub_1003DC62C(self, v37);
  if (v7)
  {
    v8 = [v37 adNetworkId];
    id v9 = [v37 version];
    sub_100263888((uint64_t)InstallAttributionImpression, v8, 1, v9, v7);
  }
  uint64_t v10 = objc_opt_new();
  id v11 = [v37 appAdamId];
  sub_100263BD8(v10, v11);

  id v12 = [v37 adNetworkId];
  sub_100263BE8(v10, v12);

  id v13 = [v37 impressionId];
  sub_100263BF8(v10, v13);

  id v14 = [v37 sourceAppAdamId];
  sub_100263C18(v10, v14);

  id v15 = [v37 timestamp];
  sub_100263C38(v10, v15);

  v16 = +[NSDate now];
  [v16 timeIntervalSince1970];
  id v18 = +[NSNumber numberWithInteger:(uint64_t)(v17 * 1000.0)];
  sub_10027030C(v10, v18);

  v19 = [v37 attributionSignature];
  sub_100263C48(v10, v19);

  id v20 = [v37 version];
  sub_100263C58(v10, v20);

  v21 = +[SKANEnvironmentHelper environmentForParams:v10];
  sub_100270224(v10, v21);

  if (v10)
  {
    *(void *)(v10 + 104) = 1;
    uint64_t v22 = [v37 interactionType];
    v23 = (void *)v22;
    if (v22) {
      v24 = (void *)v22;
    }
    else {
      v24 = (void *)ASDInstallAttributionInteractionTypeView;
    }
    sub_100270214(v10, v24);

    id v25 = *(id *)(v10 + 88);
    if (v25)
    {
      v26 = v25;
      uint64_t v27 = ASDInstallAttributionVersionCreateFromString();

      if (v27 >= 400)
      {
        v28 = [v37 sourceIdentifier];
        id v29 = [v28 integerValue];
        uint64_t v30 = 32;
        goto LABEL_16;
      }
    }
  }
  else
  {
    uint64_t v31 = [v37 interactionType];
    v32 = (void *)v31;
    if (v31) {
      id v33 = (void *)v31;
    }
    else {
      id v33 = (void *)ASDInstallAttributionInteractionTypeView;
    }
    sub_100270214(0, v33);
  }
  v28 = [v37 campaignId];
  id v29 = [v28 integerValue];
  if (!v10) {
    goto LABEL_17;
  }
  uint64_t v30 = 24;
LABEL_16:
  *(void *)(v10 + v30) = v29;
LABEL_17:

  uint64_t v34 = sub_1003C44E0();
  v35 = [v37 sourceAppBundleId];
  v36 = sub_1003C6DFC(v34, (void *)v10, v35, (char)[v37 overrideCampaignLimit]);

  if (v6) {
    v6[2](v6, v36);
  }
}

- (void)addInstallWebAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 sourceWebRegistrableDomain];
    uint64_t v10 = [v6 appAdamId];
    int v43 = 138543618;
    uint64_t v44 = v9;
    __int16 v45 = 2114;
    int v46 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received call to perform install attribution from web: %{public}@ for app: %{public}@", (uint8_t *)&v43, 0x16u);
  }
  id v11 = v6;
  id v12 = v11;
  if (!self) {
    goto LABEL_17;
  }
  id v13 = [v11 version];
  if (v13)
  {
    id v14 = [v12 version];
    uint64_t v15 = ASDInstallAttributionVersionCreateFromString();
  }
  else
  {
    uint64_t v15 = 0;
  }

  v16 = [v12 appAdamId];
  id v17 = [v16 longLongValue];

  if ((uint64_t)v17 <= 0) {
    goto LABEL_12;
  }
  id v18 = [v12 adNetworkRegistrableDomain];
  unsigned __int8 v19 = sub_1002F1FD4(v18);

  if ((v19 & 1) == 0) {
    goto LABEL_12;
  }
  id v20 = [v12 impressionId];
  id v21 = [v20 length];

  if (!v21) {
    goto LABEL_12;
  }
  uint64_t v22 = [v12 sourceWebRegistrableDomain];
  unsigned __int8 v23 = sub_1002F1FD4(v22);

  if ((v23 & 1) != 0 && v15 > 399)
  {
LABEL_17:
  }
  else
  {
LABEL_12:
    v24 = ASDErrorWithDescription();

    if (v24)
    {
      id v25 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v43 = 138543362;
        uint64_t v44 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Error found while validating web install attribution config parameters: %{public}@", (uint8_t *)&v43, 0xCu);
      }

      v26 = +[SkannerEvent resultTypeFinalized];
      uint64_t v27 = [v12 adNetworkRegistrableDomain];
      v28 = [v12 version];
      id v29 = +[SkannerEvent webImpressionWithResult:v26 adNetworkRegistrableDomain:v27 version:v28 error:v24];

      uint64_t v30 = +[SkannerCoordinator sharedInstance];
      uint64_t v31 = [v12 appAdamId];
      objc_msgSend(v30, "logEvent:forAdvertisedAppAdamID:", v29, objc_msgSend(v31, "longLongValue"));

      if (v7) {
        v7[2](v7, v24);
      }
      goto LABEL_23;
    }
  }
  id v29 = objc_opt_new();
  v32 = [v12 appAdamId];
  sub_100263BD8((uint64_t)v29, v32);

  id v33 = [v12 adNetworkRegistrableDomain];
  sub_100263BE8((uint64_t)v29, v33);

  uint64_t v34 = [v12 impressionId];
  sub_10027D6CC((uint64_t)v29, v34);

  v35 = [v12 sourceWebRegistrableDomain];
  sub_10027BF34((uint64_t)v29, v35);

  v36 = [v12 version];
  sub_100263BF8((uint64_t)v29, v36);

  id v37 = +[NSDate now];
  [v37 timeIntervalSince1970];
  uint64_t v39 = +[NSNumber numberWithInteger:(uint64_t)(v38 * 1000.0)];
  sub_100263C08((uint64_t)v29, v39);

  id v40 = [v12 attributionContext];
  if (v29) {
    v29[7] = v40;
  }
  id v41 = sub_1003C44E0();
  uint64_t v42 = sub_1003C7ACC(v41, v29);

  if (v7) {
    v7[2](v7, v42);
  }

  v24 = 0;
LABEL_23:
}

- (void)validateImpression:(id)a3 withFidelityType:(id)a4 completionHandler:(id)a5
{
  id v15 = a3;
  v7 = (void (**)(id, uint64_t))a5;
  uint64_t v8 = sub_1003DC62C(self, v15);
  id v9 = (void *)v8;
  if (v7 && v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    uint64_t v10 = [v15 sourceAppBundleId];
    id v11 = [v15 sourceAppAdamId];
    id v12 = [v15 version];
    id v13 = [v15 adNetworkId];
    id v14 = sub_1002631A8((uint64_t)InstallAttributionImpression, v10, v11, (uint64_t)v12, v13);

    if (v7) {
      v7[2](v7, (uint64_t)v14);
    }
  }
}

- (void)validateWebAdImpressionResponseProperties:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void *))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = ASDErrorWithDescription();
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v6 = sub_10027002C((uint64_t)InstallAttributionParams, v9);
  v7 = sub_1003C44E0();
  uint64_t v8 = sub_1003C7F60((uint64_t)v7, v6);

  if (v5) {
LABEL_5:
  }
    v5[2](v5, v8);
LABEL_6:
}

@end