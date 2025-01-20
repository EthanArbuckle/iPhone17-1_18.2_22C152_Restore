@interface HFErrorResultComponent
+ (BOOL)_requiresManualFixOptionToDisplaySymptom:(id)a3;
+ (id)componentForAccessoryReprovisionState:(unint64_t)a3;
+ (id)componentForDisplayError:(id)a3 symptomContextProvider:(id)a4;
+ (id)componentForSymptom:(id)a3 contextProvider:(id)a4;
+ (id)componentForUnreachableAccessoryWithContextProvider:(id)a3;
+ (id)componentForWriteErrorForCharacteristics:(id)a3 valueSource:(id)a4;
+ (int64_t)_displayPriorityForSymptom:(id)a3;
+ (int64_t)priorityForCategory:(unint64_t)a3;
- (BOOL)updateInProgress;
- (HFErrorResultComponent)init;
- (HFErrorResultComponent)initWithCategory:(unint64_t)a3;
- (HMSymptom)underlyingSymptom;
- (NSString)detailedErrorDescription;
- (NSString)errorDescription;
- (NSString)errorHandlerURLText;
- (NSString)errorMessageButtonTitle;
- (NSString)errorMessageTitle;
- (NSURL)errorHandlerURL;
- (id)description;
- (id)results;
- (int64_t)componentPriority;
- (int64_t)displayPriority;
- (unint64_t)badgeType;
- (unint64_t)category;
- (unint64_t)descriptionBadgeType;
- (void)_addAccountSymptomMessageForAccountName:(id)a3 symptom:(id)a4;
- (void)setBadgeType:(unint64_t)a3;
- (void)setDescriptionBadgeType:(unint64_t)a3;
- (void)setDetailedErrorDescription:(id)a3;
- (void)setDisplayPriority:(int64_t)a3;
- (void)setErrorDescription:(id)a3;
- (void)setErrorHandlerURL:(id)a3;
- (void)setErrorHandlerURLText:(id)a3;
- (void)setErrorMessageButtonTitle:(id)a3;
- (void)setErrorMessageTitle:(id)a3;
- (void)setUnderlyingSymptom:(id)a3;
- (void)setUpdateInProgress:(BOOL)a3;
@end

@implementation HFErrorResultComponent

+ (id)componentForAccessoryReprovisionState:(unint64_t)a3
{
  if (a3)
  {
    v4 = [[HFErrorResultComponent alloc] initWithCategory:0];
    [(HFErrorResultComponent *)v4 setDisplayPriority:1];
    v5 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAccessoryConnectionError", @"HFServiceDescriptionAccessoryConnectionError", 1);
    [(HFErrorResultComponent *)v4 setErrorDescription:v5];

    v6 = HFLocalizedWiFiString(@"HFServiceLongFormPersistentWarngingHomeKitReWAC");
    [(HFErrorResultComponent *)v4 setErrorMessageTitle:v6];

    if (a3 == 2)
    {
      [(HFErrorResultComponent *)v4 setUpdateInProgress:1];
    }
    else if (a3 == 1)
    {
      v7 = HFLocalizedWiFiString(@"HFServiceActionMessageReWAC");
      [(HFErrorResultComponent *)v4 setErrorMessageButtonTitle:v7];
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)componentForWriteErrorForCharacteristics:(id)a3 valueSource:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !+[HFUtilities shouldSuppressAllErrorsForDemo])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v5;
    v7 = (HFErrorResultComponent *)[v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v7; i = (HFErrorResultComponent *)((char *)i + 1))
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v8);
          }
          uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v6, "cachedErrorForWriteToCharacteristic:", v11, (void)v22);
          if (v12)
          {
            v13 = (void *)v12;
            v14 = HFLogForCategory(0x39uLL);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v27 = v13;
              __int16 v28 = 2112;
              uint64_t v29 = v11;
              _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "Displaying cached write error %@ for characteristic %@", buf, 0x16u);
            }

            v7 = [[HFErrorResultComponent alloc] initWithCategory:6];
            int v15 = objc_msgSend(v13, "hf_isHMErrorWithCode:", 87);
            BOOL v16 = v15 == 0;
            if (v15) {
              v17 = @"HFServiceDescriptionActionRequiredInManufacturerApp";
            }
            else {
              v17 = @"HFServiceItemDescriptionFailure";
            }
            if (v16) {
              v18 = @"HFServiceItemDescriptionFailure";
            }
            else {
              v18 = @"HFServiceLongFormErrorActionRequiredInManufacturerApp";
            }
            v19 = _HFLocalizedStringWithDefaultValue(v17, v17, 1);
            [(HFErrorResultComponent *)v7 setErrorDescription:v19];

            v20 = _HFLocalizedStringWithDefaultValue(v18, v18, 1);
            [(HFErrorResultComponent *)v7 setDetailedErrorDescription:v20];

            goto LABEL_22;
          }
        }
        v7 = (HFErrorResultComponent *)[v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HFErrorResultComponent)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithCategory_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFErrorResultComponent.m", 29, @"%s is unavailable; use %@ instead",
    "-[HFErrorResultComponent init]",
    v5);

  return 0;
}

- (HFErrorResultComponent)initWithCategory:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFErrorResultComponent;
  result = [(HFErrorResultComponent *)&v5 init];
  if (result)
  {
    result->_category = a3;
    result->_badgeType = 1;
    result->_descriptionBadgeType = 0;
  }
  return result;
}

- (int64_t)componentPriority
{
  v3 = objc_opt_class();
  unint64_t v4 = [(HFErrorResultComponent *)self category];
  return [v3 priorityForCategory:v4];
}

- (id)results
{
  v3 = objc_opt_new();
  unint64_t v4 = [(HFErrorResultComponent *)self underlyingSymptom];
  [v3 setObject:v4 forKeyedSubscript:@"symptom"];

  objc_super v5 = [(HFErrorResultComponent *)self errorDescription];
  [v3 setObject:v5 forKeyedSubscript:@"errorDescription"];

  id v6 = [(HFErrorResultComponent *)self detailedErrorDescription];
  [v3 setObject:v6 forKeyedSubscript:@"longErrorDescription"];

  v7 = [(HFErrorResultComponent *)self errorMessageTitle];
  [v3 setObject:v7 forKeyedSubscript:@"errorMessageTitle"];

  id v8 = [(HFErrorResultComponent *)self errorMessageButtonTitle];
  [v3 setObject:v8 forKeyedSubscript:@"errorMessageButtonTitle"];

  uint64_t v9 = [(HFErrorResultComponent *)self errorHandlerURL];
  [v3 setObject:v9 forKeyedSubscript:@"errorHandlerURL"];

  v10 = [(HFErrorResultComponent *)self errorHandlerURLText];
  [v3 setObject:v10 forKeyedSubscript:@"errorHandlerURLText"];

  if ([(HFErrorResultComponent *)self displayPriority])
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HFErrorResultComponent displayPriority](self, "displayPriority"));
    [v3 setObject:v11 forKeyedSubscript:@"priority"];
  }
  if ([(HFErrorResultComponent *)self badgeType])
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFErrorResultComponent badgeType](self, "badgeType"));
    [v3 setObject:v12 forKeyedSubscript:@"badge"];
  }
  if ([(HFErrorResultComponent *)self descriptionBadgeType])
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFErrorResultComponent descriptionBadgeType](self, "descriptionBadgeType"));
    [v3 setObject:v13 forKeyedSubscript:@"descriptionBadge"];
  }
  if ([(HFErrorResultComponent *)self updateInProgress])
  {
    uint64_t v14 = MEMORY[0x263EFFA88];
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"updateInProgress"];
    [v3 setObject:v14 forKeyedSubscript:@"isInStateTransition"];
  }
  return v3;
}

+ (int64_t)priorityForCategory:(unint64_t)a3
{
  return 1000 - a3;
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFErrorResultComponent category](self, "category"));
  id v5 = (id)[v3 appendObject:v4 withName:@"category"];

  id v6 = [(HFErrorResultComponent *)self errorDescription];
  [v3 appendString:v6 withName:@"description"];

  v7 = [(HFErrorResultComponent *)self underlyingSymptom];
  id v8 = (id)[v3 appendObject:v7 withName:@"symptom" skipIfNil:1];

  uint64_t v9 = [(HFErrorResultComponent *)self errorHandlerURL];
  id v10 = (id)[v3 appendObject:v9 withName:@"handler" skipIfNil:1];

  uint64_t v11 = [v3 build];

  return v11;
}

- (unint64_t)category
{
  return self->_category;
}

- (HMSymptom)underlyingSymptom
{
  return self->_underlyingSymptom;
}

- (void)setUnderlyingSymptom:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (NSString)detailedErrorDescription
{
  return self->_detailedErrorDescription;
}

- (void)setDetailedErrorDescription:(id)a3
{
}

- (int64_t)displayPriority
{
  return self->_displayPriority;
}

- (void)setDisplayPriority:(int64_t)a3
{
  self->_displayPriority = a3;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_badgeType = a3;
}

- (unint64_t)descriptionBadgeType
{
  return self->_descriptionBadgeType;
}

- (void)setDescriptionBadgeType:(unint64_t)a3
{
  self->_descriptionBadgeType = a3;
}

- (NSString)errorMessageTitle
{
  return self->_errorMessageTitle;
}

- (void)setErrorMessageTitle:(id)a3
{
}

- (NSString)errorMessageButtonTitle
{
  return self->_errorMessageButtonTitle;
}

- (void)setErrorMessageButtonTitle:(id)a3
{
}

- (NSURL)errorHandlerURL
{
  return self->_errorHandlerURL;
}

- (void)setErrorHandlerURL:(id)a3
{
}

- (NSString)errorHandlerURLText
{
  return self->_errorHandlerURLText;
}

- (void)setErrorHandlerURLText:(id)a3
{
}

- (BOOL)updateInProgress
{
  return self->_updateInProgress;
}

- (void)setUpdateInProgress:(BOOL)a3
{
  self->_updateInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorHandlerURLText, 0);
  objc_storeStrong((id *)&self->_errorHandlerURL, 0);
  objc_storeStrong((id *)&self->_errorMessageButtonTitle, 0);
  objc_storeStrong((id *)&self->_errorMessageTitle, 0);
  objc_storeStrong((id *)&self->_detailedErrorDescription, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_underlyingSymptom, 0);
}

+ (id)componentForDisplayError:(id)a3 symptomContextProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    NSLog(&cfstr_SCalledWithout.isa, "+[HFErrorResultComponent(HFServiceLikeItem) componentForDisplayError:symptomContextProvider:]");
    goto LABEL_6;
  }
  if (+[HFUtilities shouldSuppressAllErrorsForDemo])
  {
LABEL_6:
    id v10 = 0;
    goto LABEL_23;
  }
  switch([v6 category])
  {
    case 0:
    case 1:
      id v8 = [v6 contextProvider];
      uint64_t v9 = [a1 componentForUnreachableAccessoryWithContextProvider:v8];
      goto LABEL_14;
    case 2:
      id v10 = [[HFErrorResultComponent alloc] initWithCategory:1];
      uint64_t v11 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionUnavailable", @"HFServiceDescriptionUnavailable", 1);
      [(HFErrorResultComponent *)v10 setErrorDescription:v11];

      uint64_t v12 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAccessoryUnavailable", @"HFServiceDescriptionAccessoryUnavailable", 1);
      [(HFErrorResultComponent *)v10 setDetailedErrorDescription:v12];

      v13 = @"HFServiceLongFormErrorNoThreadNetworkNoResident";
      goto LABEL_10;
    case 3:
      id v10 = [[HFErrorResultComponent alloc] initWithCategory:1];
      uint64_t v14 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionUnavailable", @"HFServiceDescriptionUnavailable", 1);
      [(HFErrorResultComponent *)v10 setErrorDescription:v14];

      int v15 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAccessoryUnavailable", @"HFServiceDescriptionAccessoryUnavailable", 1);
      [(HFErrorResultComponent *)v10 setDetailedErrorDescription:v15];

      v13 = @"HFServiceLongFormErrorNoThreadNetworkResidentWithoutThread";
      goto LABEL_10;
    case 4:
      id v10 = [[HFErrorResultComponent alloc] initWithCategory:1];
      BOOL v16 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionUnavailable", @"HFServiceDescriptionUnavailable", 1);
      [(HFErrorResultComponent *)v10 setErrorDescription:v16];

      v17 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAccessoryUnavailable", @"HFServiceDescriptionAccessoryUnavailable", 1);
      [(HFErrorResultComponent *)v10 setDetailedErrorDescription:v17];

      v13 = @"HFServiceLongFormErrorNoThreadNetworkLocal";
LABEL_10:
      v18 = _HFLocalizedStringWithDefaultValue(v13, v13, 1);
      [(HFErrorResultComponent *)v10 setErrorMessageTitle:v18];

      v19 = objc_msgSend(NSURL, "hf_homeHubRequiredLearnMoreURL");
      [(HFErrorResultComponent *)v10 setErrorHandlerURL:v19];

      id v8 = _HFLocalizedStringWithDefaultValue(@"HFServiceErrorNoThreadNetworkLearnMoreTitle", @"HFServiceErrorNoThreadNetworkLearnMoreTitle", 1);
      [(HFErrorResultComponent *)v10 setErrorHandlerURLText:v8];
      goto LABEL_22;
    case 5:
      id v10 = [[HFErrorResultComponent alloc] initWithCategory:2];
      v20 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAccessoryNotSupported", @"HFServiceDescriptionAccessoryNotSupported", 1);
      [(HFErrorResultComponent *)v10 setErrorDescription:v20];

      v21 = @"HFServiceLongFormErrorDoesNotSupportNotifications";
      goto LABEL_20;
    case 6:
      id v10 = [[HFErrorResultComponent alloc] initWithCategory:4];
      long long v22 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionActionRequiredInManufacturerApp", @"HFServiceDescriptionActionRequiredInManufacturerApp", 1);
      [(HFErrorResultComponent *)v10 setErrorDescription:v22];

      v21 = @"HFServiceLongFormErrorActionRequiredInManufacturerApp";
      goto LABEL_20;
    case 7:
      id v8 = [v6 underlyingSymptom];
      uint64_t v9 = [a1 componentForSymptom:v8 contextProvider:v7];
LABEL_14:
      id v10 = (HFErrorResultComponent *)v9;
      goto LABEL_22;
    case 8:
      id v10 = [[HFErrorResultComponent alloc] initWithCategory:3];
      long long v23 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessorySplitMediaAccountErrorDescription", @"HFMediaAccessorySplitMediaAccountErrorDescription", 1);
      [(HFErrorResultComponent *)v10 setErrorDescription:v23];

      long long v24 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessorySplitMediaAccountErrorDescription", @"HFMediaAccessorySplitMediaAccountErrorDescription", 1);
      [(HFErrorResultComponent *)v10 setDetailedErrorDescription:v24];

      [(HFErrorResultComponent *)v10 setDescriptionBadgeType:4];
      [(HFErrorResultComponent *)v10 setDisplayPriority:1];
      break;
    case 9:
      id v10 = [[HFErrorResultComponent alloc] initWithCategory:3];
      long long v25 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory", @"HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory", 1);
      [(HFErrorResultComponent *)v10 setErrorDescription:v25];

      v21 = @"HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory";
      v26 = @"HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory";
      goto LABEL_21;
    case 10:
      id v10 = [[HFErrorResultComponent alloc] initWithCategory:3];
      v21 = @"HFSiriEndpointAccessoryRequestingSessionErrorDescription";
      goto LABEL_20;
    case 11:
      id v10 = [[HFErrorResultComponent alloc] initWithCategory:3];
      v21 = @"HFSiriEndpointAccessorySessionDroppedErrorDescription";
      goto LABEL_20;
    case 12:
      id v10 = [[HFErrorResultComponent alloc] initWithCategory:3];
      v21 = @"HFSiriEndpointAccessorySiriDisabledErrorDescription";
LABEL_20:
      v26 = v21;
LABEL_21:
      id v8 = _HFLocalizedStringWithDefaultValue(v21, v26, 1);
      [(HFErrorResultComponent *)v10 setDetailedErrorDescription:v8];
LABEL_22:

      break;
    default:
      goto LABEL_6;
  }
LABEL_23:

  return v10;
}

+ (id)componentForUnreachableAccessoryWithContextProvider:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[HFErrorResultComponent alloc] initWithCategory:1];
  uint64_t v5 = objc_msgSend(v3, "hf_remoteAccessState");
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 3;
  }
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke;
  v27 = &unk_26409A0B0;
  id v7 = v3;
  id v28 = v7;
  uint64_t v29 = v6;
  unsigned int v8 = objc_msgSend(v7, "hf_isUserAtHome");
  if ((unint64_t)(v6 - 3) < 0xFFFFFFFFFFFFFFFELL) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  [(HFErrorResultComponent *)v4 setDisplayPriority:v9];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_2;
  v21[3] = &unk_26409A0D8;
  id v10 = v7;
  id v22 = v10;
  uint64_t v23 = v6;
  uint64_t v11 = __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_2((uint64_t)v21);
  [(HFErrorResultComponent *)v4 setErrorDescription:v11];

  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_3;
  v18 = &unk_26409A0D8;
  id v19 = v10;
  uint64_t v20 = v6;
  id v12 = v10;
  v13 = __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_3((uint64_t)&v15);
  -[HFErrorResultComponent setDetailedErrorDescription:](v4, "setDetailedErrorDescription:", v13, v15, v16, v17, v18);

  return v4;
}

BOOL __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke(uint64_t a1)
{
  return (objc_msgSend(*(id *)(a1 + 32), "hf_isUserAtHome") & 1) != 0
      || (unint64_t)(*(void *)(a1 + 40) - 3) < 0xFFFFFFFFFFFFFFFELL;
}

id __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "hf_isUserAtHome");
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if ((unint64_t)(v3 - 1) < 2)
    {
      uint64_t v5 = @"HFServiceDescriptionUnavailable";
      goto LABEL_10;
    }
    if (v3 != 3 && v3 != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v5 = @"HFServiceDescriptionNoResponse";
LABEL_10:
  v2 = _HFLocalizedStringWithDefaultValue(v5, v5, 1);
LABEL_11:
  return v2;
}

id __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_3(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "hf_isUserAtHome");
  if (v2)
  {
LABEL_3:
    uint64_t v3 = @"HFServiceLongFormErrorNotReachable";
LABEL_4:
    v2 = _HFLocalizedStringWithDefaultValue(v3, v3, 1);
  }
  else
  {
    switch(*(void *)(a1 + 40))
    {
      case 0:
      case 3:
        goto LABEL_3;
      case 1:
        uint64_t v3 = @"HFServiceLongFormErrorNoResidentDevice";
        goto LABEL_4;
      case 2:
        uint64_t v3 = @"HFServiceLongFormErrorResidentDeviceNotReachable";
        goto LABEL_4;
      default:
        break;
    }
  }
  return v2;
}

+ (id)componentForSymptom:(id)a3 contextProvider:(id)a4
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    NSLog(&cfstr_SWithoutASympt.isa, "+[HFErrorResultComponent(HFServiceLikeItem) componentForSymptom:contextProvider:]");
  }
  if ([a1 _requiresManualFixOptionToDisplaySymptom:v7]
    && ![v8 shouldDisplayManualFixOptionForSymptom:v7])
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v9 = [[HFErrorResultComponent alloc] initWithCategory:3];
    [(HFErrorResultComponent *)v9 setUnderlyingSymptom:v7];
    -[HFErrorResultComponent setDisplayPriority:](v9, "setDisplayPriority:", [a1 _displayPriorityForSymptom:v7]);
    uint64_t v10 = [v7 type];
    uint64_t v11 = 0;
    switch(v10)
    {
      case 1:
      case 20:
        id v12 = [v8 detailedErrorDescriptionForiCloudSymptom];
        [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v12];

        [(HFErrorResultComponent *)v9 setDescriptionBadgeType:4];
        uint64_t v13 = [v8 currentUserID];
        goto LABEL_12;
      case 2:
        uint64_t v15 = _HFLocalizedStringWithDefaultValue(@"HFSymptomLongDescriptionNeediTunesCredential", @"HFSymptomLongDescriptionNeediTunesCredential", 1);
        [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v15];

        [(HFErrorResultComponent *)v9 setDescriptionBadgeType:4];
        uint64_t v13 = [v8 currentAppleMusicAccountName];
LABEL_12:
        uint64_t v16 = (void *)v13;
        [(HFErrorResultComponent *)v9 _addAccountSymptomMessageForAccountName:v13 symptom:v7];
        goto LABEL_57;
      case 3:
        uint64_t v16 = [v8 accessoryName];
        HFLocalizedStringWithFormat(@"HFSymptomLongDescriptionHomekitProblem", @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
        goto LABEL_32;
      case 4:
        if (+[HFUtilities isInternalInstall])
        {
          uint64_t v23 = [v8 currentDeviceNetworkSSID];
          int v24 = [v23 isEqualToString:@"AppleWiFi"];

          if (v24)
          {
            uint64_t v25 = NSString;
            v26 = HFLocalizedWiFiString(@"HFSymptomLongDescriptionWifiUnsupportedNetwork");
            id v135 = 0;
            v27 = [v8 homeKitObjectName];
            id v28 = [v8 currentDeviceNetworkSSID];
            uint64_t v29 = [v25 stringWithValidatedFormat:v26, @"%@ %@", &v135, v27, v28 validFormatSpecifiers error];
            id v30 = v135;
            [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v29];

            goto LABEL_58;
          }
        }
        v95 = NSString;
        v49 = HFLocalizedWiFiString(@"HFSymptomLongDescriptionWifiConnectionProblem");
        v134 = 0;
        v50 = [v8 homeKitObjectName];
        v51 = [v95 stringWithValidatedFormat:v49, @"%@", &v134, v50 validFormatSpecifiers error];
        v52 = v134;
LABEL_46:
        id v96 = v52;
        [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v51];

        goto LABEL_88;
      case 5:
        uint64_t v31 = HFLocalizedWiFiString(@"HFSymptomStatusTextWiFiLostConnection");
        goto LABEL_51;
      case 6:
      case 15:
        goto LABEL_73;
      case 7:
        v32 = [v8 accessoryName];
        v39 = HFLocalizedStringWithFormat(@"HFSymptomLongDescriptionHardwareFailure", @"%@", v33, v34, v35, v36, v37, v38, (uint64_t)v32);
        [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v39];

        v40 = _HFLocalizedStringWithDefaultValue(@"HFSymptomLongDescriptionHardwareFailureContactSupport", @"HFSymptomLongDescriptionHardwareFailureContactSupport", 1);
        [(HFErrorResultComponent *)v9 setErrorMessageTitle:v40];

        uint64_t v41 = _HFLocalizedStringWithDefaultValue(@"HFSymptomLongDescriptionHardwareFailureContactSupport", @"HFSymptomLongDescriptionHardwareFailureContactSupport", 1);
        goto LABEL_29;
      case 8:
        uint64_t v16 = [v8 homeKitObjectName];
        HFLocalizedStringWithFormat(@"HFSymptomDetailedDescriptionStereoVersionMismatch", @"%@", v42, v43, v44, v45, v46, v47, (uint64_t)v16);
        goto LABEL_32;
      case 9:
        uint64_t v14 = @"HFSymptomDetailedDescriptionStereoNotFound";
        goto LABEL_50;
      case 10:
        v48 = NSString;
        v49 = HFLocalizedWiFiString(@"HFSymptomDetailedDescriptionStereoError");
        v131 = 0;
        v50 = [v8 homeKitObjectName];
        v51 = [v48 stringWithValidatedFormat:v49, @"%@", &v131, v50 validFormatSpecifiers error];
        v52 = v131;
        goto LABEL_46;
      case 11:
        uint64_t v53 = [v8 currentDeviceNetworkSSID];
        if (v53)
        {
          uint64_t v16 = (void *)v53;
          v54 = HFLocalizedWiFiString(@"HFSymptomLongDescriptionProblemWifiMismatch");
          v55 = [v8 accessoryNetworkSSID];

          if (v55)
          {
            v56 = NSString;
            id v133 = 0;
            v57 = [v8 accessoryNetworkSSID];
            v58 = [v56 stringWithValidatedFormat:v54, @"%@", &v133, v57 validFormatSpecifiers error];
            id v59 = v133;
            [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v58];
          }
          else
          {
            v106 = HFLocalizedWiFiString(@"HFSymptomLongDescriptionProblemWifiMismatchNone");
            [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v106];
          }
          v107 = [v8 accessoryUUID];

          if (v107)
          {
            v114 = [v8 accessoryUUID];
            v115 = +[HFURLComponents fixSymptomURLForAccessoryWithUUID:v114 symptom:v7];
            [(HFErrorResultComponent *)v9 setErrorHandlerURL:v115];
          }
          v116 = HFLocalizedStringWithFormat(@"HFSymptomLongDescriptionProblemWifiMisMatchLinkString", @"%@", v108, v109, v110, v111, v112, v113, (uint64_t)v16);
          [(HFErrorResultComponent *)v9 setErrorHandlerURLText:v116];

          goto LABEL_33;
        }
        v97 = HFLogForCategory(0);
        if (!os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
          goto LABEL_78;
        }
        *(_WORD *)buf = 0;
        goto LABEL_90;
      case 12:
        uint64_t v14 = @"HFSymptomDetailedDescriptionTargetControlMissing";
        goto LABEL_50;
      case 13:
        uint64_t v14 = @"HFSymptomLongDescriptionVPNProfileExpired";
        goto LABEL_50;
      case 14:
        v60 = HFLocalizedWiFiString(@"HFSymptomLongDescription8021xNetworkProblem");
        [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v60];

        if (+[HFUtilities isAMac]) {
          goto LABEL_58;
        }
        uint64_t v41 = HFLocalizedWiFiString(@"HFSymptomActionMessageWifiSettings");
LABEL_29:
        uint64_t v16 = (void *)v41;
        [(HFErrorResultComponent *)v9 setErrorMessageButtonTitle:v41];
        goto LABEL_57;
      case 16:
        v61 = [v8 accessoryNetworkSSID];
        uint64_t v62 = [v61 length];

        if (!v62)
        {
          uint64_t v14 = @"HFSymptomLongDescriptionNetworkProfileFixProblem";
          goto LABEL_50;
        }
        uint64_t v16 = [v8 accessoryNetworkSSID];
        HFLocalizedStringWithFormat(@"HFSymptomLongDescriptionNetworkProfileFixProblemWithName", @"%@", v63, v64, v65, v66, v67, v68, (uint64_t)v16);
        v54 = LABEL_32:;
        [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v54];
LABEL_33:

        goto LABEL_57;
      case 17:
        v69 = [v8 accessoryNetworkSSID];
        uint64_t v70 = [v69 length];

        if (v70)
        {
          v71 = [v8 accessoryNetworkSSID];
          v78 = HFLocalizedStringWithFormat(@"HFSymptomLongDescriptionNetworkProfileInstallProblemWithName", @"%@", v72, v73, v74, v75, v76, v77, (uint64_t)v71);
          [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v78];
        }
        else
        {
          v71 = _HFLocalizedStringWithDefaultValue(@"HFSymptomLongDescriptionNetworkProfileInstallProblem", @"HFSymptomLongDescriptionNetworkProfileInstallProblem", 1);
          [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v71];
        }

        uint64_t v98 = objc_msgSend(NSURL, "hf_learnAboutNetworksRequiringProfilesURL");
        goto LABEL_56;
      case 18:
        v79 = [v8 accessoryNetworkSSID];
        uint64_t v80 = [v79 length];

        if (v80)
        {
          v81 = [v8 accessoryNetworkSSID];
          v88 = HFLocalizedStringWithFormat(@"HFSymptomLongDescriptionNetworkNotShareableProblemWithName", @"%@", v82, v83, v84, v85, v86, v87, (uint64_t)v81);
          [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v88];
        }
        else
        {
          v81 = _HFLocalizedStringWithDefaultValue(@"HFSymptomLongDescriptionNetworkNotShareableProblem", @"HFSymptomLongDescriptionNetworkNotShareableProblem", 1);
          [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v81];
        }

        uint64_t v98 = objc_msgSend(NSURL, "hf_learnAboutUnshareableNetworksURL");
LABEL_56:
        v99 = (void *)v98;
        [(HFErrorResultComponent *)v9 setErrorHandlerURL:v98];

        uint64_t v16 = _HFLocalizedStringWithDefaultValue(@"HFSymptomDescriptionLearnMore", @"HFSymptomDescriptionLearnMore", 1);
        [(HFErrorResultComponent *)v9 setErrorHandlerURLText:v16];
        goto LABEL_57;
      case 19:
        uint64_t v89 = [v8 currentDeviceNetworkSSID];
        if (v89)
        {
          v90 = (void *)v89;
          v91 = [v8 accessoryNetworkSSID];
          v92 = v91;
          if (v91)
          {
            id v93 = v91;
          }
          else
          {
            id v93 = [v8 currentDeviceNetworkSSID];
          }
          v117 = v93;

          v118 = HFLocalizedWiFiString(@"HFSymptomLongDescriptionProblemNeedCaptiveLeaseRenewal");
          id v132 = 0;
          v119 = [NSString stringWithValidatedFormat:v118, @"%@", &v132, v117 validFormatSpecifiers error];
          id v96 = v132;
          [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v119];

          v120 = [v8 accessoryUUID];

          if (v120)
          {
            v127 = [v8 accessoryUUID];
            v128 = +[HFURLComponents fixSymptomURLForAccessoryWithUUID:v127 symptom:v7];
            [(HFErrorResultComponent *)v9 setErrorHandlerURL:v128];
          }
          v129 = HFLocalizedStringWithFormat(@"HFSymptomLongDescriptionProblemNeedCaptiveLeaseRenewalLinkString", @"%@", v121, v122, v123, v124, v125, v126, (uint64_t)v117);
          [(HFErrorResultComponent *)v9 setErrorHandlerURLText:v129];

LABEL_88:
          goto LABEL_58;
        }
        v97 = HFLogForCategory(0);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
LABEL_90:
          _os_log_error_impl(&dword_20B986000, v97, OS_LOG_TYPE_ERROR, "Skipping WiFi Network Mismatch symptom; We aren't connected to a WiFi network, so that doesn't make any sense.",
            buf,
            2u);
        }
LABEL_78:

        goto LABEL_79;
      default:
        if (v10 == 1000)
        {
          NSLog(&cfstr_SymptomTypeHms.isa);
        }
        else
        {
          if (v10 == 999)
          {
            uint64_t v14 = @"HMSymptomLongDescriptionSharedUserErrorNotification";
LABEL_50:
            uint64_t v31 = _HFLocalizedStringWithDefaultValue(v14, v14, 1);
LABEL_51:
            uint64_t v16 = (void *)v31;
            [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v31];
LABEL_57:

LABEL_58:
            v100 = [(HFErrorResultComponent *)v9 detailedErrorDescription];

            if (v100)
            {
              v101 = objc_msgSend(v7, "hf_shortDescription");
              [(HFErrorResultComponent *)v9 setErrorDescription:v101];
            }
            if ([v8 fixStateForSymptom:v7] != 1) {
              goto LABEL_72;
            }
            if ([v7 type] == 11)
            {
              v102 = @"HFServiceDescriptionUpdatingNetwork";
            }
            else
            {
              if ([v7 type] != 19)
              {
                if ([v7 type] == 1 || objc_msgSend(v7, "type") == 2 || objc_msgSend(v7, "type") == 20)
                {
                  v104 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAuthenticatingAccount", @"HFServiceDescriptionAuthenticatingAccount", 1);
                  [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v104];

                  [(HFErrorResultComponent *)v9 setErrorHandlerURL:0];
                  [(HFErrorResultComponent *)v9 setErrorHandlerURLText:0];
                }
                [(HFErrorResultComponent *)v9 setUpdateInProgress:1];
                goto LABEL_71;
              }
              v102 = @"HFServiceDescriptionJoiningCaptive";
            }
            v103 = HFLocalizedWiFiString(v102);
            [(HFErrorResultComponent *)v9 setDetailedErrorDescription:v103];

            [(HFErrorResultComponent *)v9 setErrorHandlerURL:0];
            [(HFErrorResultComponent *)v9 setErrorHandlerURLText:0];
LABEL_71:
            [(HFErrorResultComponent *)v9 setBadgeType:0];
LABEL_72:
            uint64_t v11 = v9;
            goto LABEL_73;
          }
          v94 = HFLogForCategory(0);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            v130 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            uint64_t v137 = 0;
            __int16 v138 = 2112;
            v139 = v130;
            __int16 v140 = 2048;
            uint64_t v141 = [v7 type];
            _os_log_error_impl(&dword_20B986000, v94, OS_LOG_TYPE_ERROR, "%@:%@ Unhandled symptom type: %ld", buf, 0x20u);
          }
        }
LABEL_79:
        uint64_t v11 = 0;
LABEL_73:

        break;
    }
  }

  return v11;
}

+ (int64_t)_displayPriorityForSymptom:(id)a3
{
  uint64_t v3 = [a3 type];
  if ((unint64_t)(v3 - 1) > 0x13) {
    return 0;
  }
  else {
    return qword_20BD13A48[v3 - 1];
  }
}

+ (BOOL)_requiresManualFixOptionToDisplaySymptom:(id)a3
{
  unint64_t v3 = [a3 type];
  return (v3 < 0x15) & (0x10200Eu >> v3);
}

- (void)_addAccountSymptomMessageForAccountName:(id)a3 symptom:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [a3 length];
  uint64_t v9 = [v7 type];
  if (v9 != 20)
  {
    if (v9 == 2)
    {
      if (v8)
      {
        uint64_t v10 = @"HFAppleMusicAccountIncorrectCredentials";
        goto LABEL_8;
      }
      uint64_t v14 = @"HFAppleMusicAccountNoCredentials";
      goto LABEL_15;
    }
    if (v9 != 1)
    {
      id v12 = HFLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = NSStringFromSelector(a2);
        int v18 = 138412802;
        uint64_t v19 = self;
        __int16 v20 = 2112;
        uint64_t v21 = v17;
        __int16 v22 = 2048;
        uint64_t v23 = [v7 type];
        _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "%@:%@ Unhandled symptom type: %ld", (uint8_t *)&v18, 0x20u);
      }
      if (v8) {
        goto LABEL_12;
      }
LABEL_16:
      uint64_t v13 = @"HFAppleMusicSignIn";
      goto LABEL_17;
    }
  }
  if (!v8)
  {
    uint64_t v14 = @"HFAppleiCloudAccountNoCredentials";
LABEL_15:
    uint64_t v15 = _HFLocalizedStringWithDefaultValue(v14, v14, 1);
    [(HFErrorResultComponent *)self setErrorMessageTitle:v15];

    goto LABEL_16;
  }
  uint64_t v10 = @"HFAppleiCloudAccountIncorrectCredentials";
LABEL_8:
  uint64_t v11 = _HFLocalizedStringWithDefaultValue(v10, v10, 1);
  [(HFErrorResultComponent *)self setErrorMessageTitle:v11];

LABEL_12:
  uint64_t v13 = @"HFEnterPassword";
LABEL_17:
  uint64_t v16 = _HFLocalizedStringWithDefaultValue(v13, v13, 1);
  [(HFErrorResultComponent *)self setErrorMessageButtonTitle:v16];
}

@end