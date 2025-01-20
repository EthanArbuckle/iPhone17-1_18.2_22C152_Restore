@interface NSError(NPHCellularError)
+ (id)NPHCellularErrorWithCode:()NPHCellularError forSubscriptionContext:;
+ (id)NPHCellularSanitizedError:()NPHCellularError forSubscriptionContext:;
+ (id)_titleAndMessageDictForError:()NPHCellularError forSubscriptionContext:;
+ (uint64_t)_canControlLTEVoiceOptionsSeparately;
@end

@implementation NSError(NPHCellularError)

+ (id)NPHCellularErrorWithCode:()NPHCellularError forSubscriptionContext:
{
  id v6 = a4;
  switch(a3)
  {
    case 2:
      BOOL v7 = +[NPHSharedUtilities isActiveDeviceTinker];
      v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v9 = v8;
      if (v7)
      {
        v10 = [v8 localizedStringForKey:@"NPHCELLULARERROR_NO_SIM_IN_COMPANION_TITLE_TINKER" value:&stru_26E895688 table:0];

        v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v12 = v11;
        v13 = @"NPHCELLULARERROR_NO_SIM_IN_COMPANION_NO_PLAN_MESSAGE_TINKER";
      }
      else
      {
        v10 = [v8 localizedStringForKey:@"NPHCELLULARERROR_NO_SIM_IN_COMPANION_TITLE" value:&stru_26E895688 table:0];

        v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v12 = v11;
        v13 = @"NPHCELLULARERROR_NO_SIM_IN_COMPANION_NO_PLAN_MESSAGE";
      }
      goto LABEL_13;
    case 3:
      unint64_t v17 = 0x263F08000uLL;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = [v18 localizedStringForKey:@"NPHCELLULARERROR_NOT_SUPPORTED_BY_CARRIER_TITLE" value:&stru_26E895688 table:0];

      v19 = +[NPHCellularBridgeUIManager sharedInstance];
      v12 = [v19 carrierNameForSubscription:v6];

      if ([v12 length])
      {
        if (+[NPHSharedUtilities isActiveDeviceTinker])
        {
          BOOL v20 = 1;
LABEL_15:
          id v35 = v6;
          v36 = +[NPHCellularBridgeUIManager sharedInstance];
          v37 = [v36 tinkerFamilyMemberFirstName];

          v38 = NSString;
          v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v40 = v39;
          if (v20)
          {
            v41 = [v39 localizedStringForKey:@"NPHCELLULARERROR_NOT_SUPPORTED_BY_CARRIER_MESSAGE_CROSS_CARRIER" value:&stru_26E895688 table:0];
            objc_msgSend(v38, "stringWithFormat:", v41, v12, v37);
          }
          else
          {
            v41 = [v39 localizedStringForKey:@"NPHCELLULARERROR_NOT_SUPPORTED_BY_CARRIER_MESSAGE_CROSS_CARRIER_NO_NAME" value:&stru_26E895688 table:0];
            objc_msgSend(v38, "stringWithFormat:", v41, v37, v48);
          v16 = };

          id v6 = v35;
          unint64_t v17 = 0x263F08000;
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      uint64_t v34 = [v12 caseInsensitiveCompare:@"Carrier"];
      BOOL v20 = v34 != 0;
      if (+[NPHSharedUtilities isActiveDeviceTinker]) {
        goto LABEL_15;
      }
      if (v34)
      {
LABEL_20:
        v42 = NSString;
        v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v43 = [v37 localizedStringForKey:@"NPHCELLULARERROR_NOT_SUPPORTED_BY_CARRIER_MESSAGE" value:&stru_26E895688 table:0];
        v16 = objc_msgSend(v42, "stringWithFormat:", v43, v12);

        unint64_t v17 = 0x263F08000uLL;
        goto LABEL_21;
      }
      v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = [v37 localizedStringForKey:@"NPHCELLULARERROR_NOT_SUPPORTED_BY_CARRIER_MESSAGE_NO_NAME" value:&stru_26E895688 table:0];
LABEL_21:

      v44 = [*(id *)(v17 + 1760) bundleForClass:objc_opt_class()];
      v15 = [v44 localizedStringForKey:@"NPHCELLULARERROR_NOT_SUPPORTED_BY_CARRIER_URL" value:&stru_26E895688 table:0];

      v14 = 0;
LABEL_22:

LABEL_23:
      v45 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
      [v45 setObject:v10 forKeyedSubscript:NPHCellularErrorTitleKey];
      [v45 setObject:v16 forKeyedSubscript:*MEMORY[0x263F08320]];
      [v45 setObject:v15 forKeyedSubscript:NPHCellularErrorLinkKey];
      [v45 setObject:v14 forKeyedSubscript:NPHCellularErrorLinkTextKey];
      v46 = [MEMORY[0x263F087E8] errorWithDomain:NPHCellularErrorDomain code:a3 userInfo:v45];

      return v46;
    case 4:
      v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = [v21 localizedStringForKey:@"NPHCELLULARERROR_NOT_SET_UP_TITLE" value:&stru_26E895688 table:0];

      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = v11;
      v13 = @"NPHCELLULARERROR_NOT_SET_UP_MESSAGE";
LABEL_13:
      v16 = [v11 localizedStringForKey:v13 value:&stru_26E895688 table:0];
      v14 = 0;
      v15 = 0;
      goto LABEL_22;
    case 5:
      v22 = +[NPHCellularBridgeUIManager sharedInstance];
      v12 = [v22 lteOverrideForSubscription:v6];

      v23 = NSString;
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v24 localizedStringForKey:@"NPHCELLULARERROR_LTE_IMPACTING_SERVICE_TITLE" value:&stru_26E895688 table:0];
      v25 = id v49 = v6;
      v10 = objc_msgSend(v23, "stringWithFormat:", v25, v12);

      int v26 = [a1 _canControlLTEVoiceOptionsSeparately];
      v27 = @"NPHCELLULARERROR_LTE_IMPACTING_SERVICE_MESSAGE";
      if (v26) {
        v27 = @"NPHCELLULARERROR_LTE_VOICE_IMPACTING_SERVICE_MESSAGE";
      }
      v28 = NSString;
      v29 = (void *)MEMORY[0x263F086E0];
      v30 = v27;
      v31 = [v29 bundleForClass:objc_opt_class()];
      v32 = [v31 localizedStringForKey:v30 value:&stru_26E895688 table:0];

      v16 = objc_msgSend(v28, "stringWithFormat:", v32, v12, v12);

      v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v14 = [v33 localizedStringForKey:@"NPHCELLULARERROR_LTE_IMPACTING_SERVICE_LINK_TEXT" value:&stru_26E895688 table:0];

      id v6 = v49;
      v15 = @"prefs:root=MOBILE_DATA_SETTINGS_ID&path=CELLULAR_DATA_OPTIONS";
      goto LABEL_22;
    default:
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v10 = 0;
      goto LABEL_23;
  }
}

+ (id)_titleAndMessageDictForError:()NPHCellularError forSubscriptionContext:
{
  v72[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 domain];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F31920]];

  if (v8)
  {
    v9 = +[NPHCellularBridgeUIManager sharedInstance];
    v10 = [v9 carrierNameForSubscription:v6];

    id v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    switch([v5 code])
    {
      case 2:
        v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v15 localizedStringForKey:@"CTCELLULARPLANERROR_PARSE_TITLE" value:&stru_26E895688 table:0];

        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        unint64_t v17 = v16;
        v18 = @"CTCELLULARPLANERROR_PARSE_MESSAGE";
        goto LABEL_28;
      case 5:
        v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v23 localizedStringForKey:@"CTCELLULARPLANERROR_FAILED_ACTION_TITLE" value:&stru_26E895688 table:0];

        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        unint64_t v17 = v16;
        v18 = @"CTCELLULARPLANERROR_FAILED_ACTION_MESSAGE";
        goto LABEL_28;
      case 6:
        v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v25 = v24;
        int v26 = @"CTCELLULARPLANERROR_INVALID_ARGUMENT_TITLE";
        goto LABEL_16;
      case 13:
        v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v27 localizedStringForKey:@"CTCELLULARPLANERROR_BUSY_TITLE" value:&stru_26E895688 table:0];

        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        unint64_t v17 = v16;
        v18 = @"CTCELLULARPLANERROR_BUSY_MESSAGE";
        goto LABEL_28;
      case 14:
        v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v28 localizedStringForKey:@"CTCELLULARPLANERROR_ROAMING_UNSUPPORTED_TITLE" value:&stru_26E895688 table:0];

        if (+[NPHSharedUtilities isActiveDeviceTinker])
        {
          if ([v10 length])
          {
            v29 = NSString;
            v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v31 = v30;
            v32 = @"CTCELLULARPLANERROR_ROAMING_UNSUPPORTED_MESSAGE_TINKER";
            goto LABEL_35;
          }
          v63 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v31 = v63;
          v64 = @"CTCELLULARPLANERROR_ROAMING_UNSUPPORTED_MESSAGE_TINKER_NO_NAME";
        }
        else
        {
          v63 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v31 = v63;
          v64 = @"CTCELLULARPLANERROR_ROAMING_UNSUPPORTED_MESSAGE";
        }
        goto LABEL_51;
      case 17:
        v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v25 = v24;
        int v26 = @"CTCELLULARPLANERROR_UNSUPPORTED_ACTION_TITLE";
        goto LABEL_16;
      case 18:
        v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v25 = v24;
        int v26 = @"CTCELLULARPLANERROR_GENERAL_TITLE";
LABEL_16:
        v14 = [v24 localizedStringForKey:v26 value:&stru_26E895688 table:0];

        id v11 = 0;
        v12 = 0;
        v13 = 0;
        goto LABEL_54;
      case 20:
        v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v33 localizedStringForKey:@"CTCELLULARPLANERROR_INSTALL_REQUIRES_DELETE_TITLE" value:&stru_26E895688 table:0];

        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        unint64_t v17 = v16;
        v18 = @"CTCELLULARPLANERROR_INSTALL_REQUIRES_DELETE_MESSAGE";
        goto LABEL_28;
      case 21:
        uint64_t v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v34 localizedStringForKey:@"CTCELLULARPLANERROR_SKU_MISMATCH_TITLE" value:&stru_26E895688 table:0];

        if ([v10 length])
        {
          id v35 = NSString;
          v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v37 = [v36 localizedStringForKey:@"CTCELLULARPLANERROR_SKU_MISMATCH_MESSAGE" value:&stru_26E895688 table:0];
          v13 = objc_msgSend(v35, "stringWithFormat:", v37, v10);
        }
        else
        {
          v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v13 = [v36 localizedStringForKey:@"CTCELLULARPLANERROR_SKU_MISMATCH_MESSAGE_NO_NAME" value:&stru_26E895688 table:0];
        }

        v67 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v12 = [v67 localizedStringForKey:@"CTCELLULARPLANERROR_SKU_MISMATCH_URL" value:&stru_26E895688 table:0];

        id v11 = 0;
        goto LABEL_54;
      case 22:
        v31 = [MEMORY[0x263F087E8] NPHCellularErrorWithCode:3 forSubscriptionContext:v6];
        v38 = [v31 userInfo];
        v14 = [v38 objectForKeyedSubscript:NPHCellularErrorTitleKey];

        v39 = [v31 userInfo];
        uint64_t v40 = [v39 objectForKeyedSubscript:*MEMORY[0x263F08320]];
        goto LABEL_37;
      case 25:
        v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v41 localizedStringForKey:@"CTCELLULARPLANERROR_INVALID_PPR_TITLE" value:&stru_26E895688 table:0];

        if ([v10 length])
        {
          v42 = NSString;
          v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v39 = [v31 localizedStringForKey:@"CTCELLULARPLANERROR_INVALID_PPR_MESSAGE" value:&stru_26E895688 table:0];
          objc_msgSend(v42, "stringWithFormat:", v39, v10, v10);
          goto LABEL_36;
        }
        v63 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v31 = v63;
        v64 = @"CTCELLULARPLANERROR_INVALID_PPR_MESSAGE_NO_NAME";
        goto LABEL_51;
      case 26:
        v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v43 localizedStringForKey:@"CTCELLULARPLANERROR_INVALID_FAUX_CARD_TITLE" value:&stru_26E895688 table:0];

        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        unint64_t v17 = v16;
        v18 = @"CTCELLULARPLANERROR_INVALID_FAUX_CARD_MESSAGE";
        goto LABEL_28;
      case 27:
        v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v44 localizedStringForKey:@"CTCELLULARPLANERROR_MULTI_SIM_TITLE" value:&stru_26E895688 table:0];

        v45 = +[NPHCellularBridgeUIManager sharedInstance];
        v46 = [v45 carrierPhoneNumberForSubscription:v6];

        if ([v10 length] && objc_msgSend(v46, "length"))
        {
          v47 = NSString;
          uint64_t v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v49 = [v48 localizedStringForKey:@"CTCELLULARPLANERROR_MULTI_SIM_MESSAGE_PHONE_NUMBER" value:&stru_26E895688 table:0];
          v72[0] = v10;
          v72[1] = v46;
          v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:2];
          v13 = [v47 stringWithPositionalSpecifiersFormat:v49 arguments:v50];

          v12 = [NSString stringWithFormat:@"tel://%@", v46];
          id v11 = v46;
        }
        else
        {
          if ([v10 length])
          {
            v59 = NSString;
            v60 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v61 = [v60 localizedStringForKey:@"CTCELLULARPLANERROR_MULTI_SIM_MESSAGE_NAME" value:&stru_26E895688 table:0];
            v71 = v10;
            v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];
            v13 = [v59 stringWithPositionalSpecifiersFormat:v61 arguments:v62];
          }
          else
          {
            v60 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v13 = [v60 localizedStringForKey:@"CTCELLULARPLANERROR_MULTI_SIM_MESSAGE" value:&stru_26E895688 table:0];
          }

          id v11 = 0;
          v12 = 0;
        }

        goto LABEL_54;
      case 30:
        v51 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v51 localizedStringForKey:@"CTCELLULARPLANERROR_WATCH_LOCKED_TITLE" value:&stru_26E895688 table:0];

        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        unint64_t v17 = v16;
        v18 = @"CTCELLULARPLANERROR_WATCH_LOCKED_MESSAGE";
LABEL_28:
        v13 = [v16 localizedStringForKey:v18 value:&stru_26E895688 table:0];

        goto LABEL_53;
      case 31:
        v52 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v52 localizedStringForKey:@"CTCELLULARPLANERROR_LOCKED_SIM_IN_COMPANION_TITLE" value:&stru_26E895688 table:0];

        if ([v10 length])
        {
          v29 = NSString;
          v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v31 = v30;
          v32 = @"CTCELLULARPLANERROR_LOCKED_SIM_IN_COMPANION_MESSAGE";
          goto LABEL_35;
        }
        v63 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v31 = v63;
        v64 = @"CTCELLULARPLANERROR_LOCKED_SIM_IN_COMPANION_MESSAGE_NO_NAME";
        goto LABEL_51;
      case 32:
        v53 = +[NPHCellularBridgeUIManager sharedInstance];
        uint64_t v54 = [v53 _minMajorWatchOSVersionForSubscription:v6];

        v55 = [MEMORY[0x263F57700] activeDevice];
        int v56 = [v55 isCellularSeries3];

        v57 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v58 = v57;
        if (v54 >= 9 && v56)
        {
          v14 = [v57 localizedStringForKey:@"CTCELLULARPLANERROR_CANNOT_SOFTWARE_UPDATE_TITLE" value:&stru_26E895688 table:0];

          if ([v10 length])
          {
            v29 = NSString;
            v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v31 = v30;
            v32 = @"CTCELLULARPLANERROR_CANNOT_SOFTWARE_UPDATE_MESSAGE";
LABEL_35:
            v39 = [v30 localizedStringForKey:v32 value:&stru_26E895688 table:0];
            objc_msgSend(v29, "stringWithFormat:", v39, v10, v70);
            uint64_t v40 = LABEL_36:;
LABEL_37:
            v13 = (void *)v40;
          }
          else
          {
            v63 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v31 = v63;
            v64 = @"CTCELLULARPLANERROR_CANNOT_SOFTWARE_UPDATE_MESSAGE_NO_NAME";
LABEL_51:
            v13 = [v63 localizedStringForKey:v64 value:&stru_26E895688 table:0];
          }

LABEL_53:
          id v11 = 0;
          v12 = 0;
        }
        else
        {
          v14 = [v57 localizedStringForKey:@"CTCELLULARPLANERROR_REQUIRES_SOFTWARE_UPDATE_TITLE" value:&stru_26E895688 table:0];

          v65 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v13 = [v65 localizedStringForKey:@"CTCELLULARPLANERROR_REQUIRES_SOFTWARE_UPDATE_MESSAGE" value:&stru_26E895688 table:0];

          v66 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v11 = [v66 localizedStringForKey:@"CTCELLULARPLANERROR_REQUIRES_SOFTWARE_UPDATE_MESSAGE_LINK_TEXT" value:&stru_26E895688 table:0];

          v12 = @"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK";
        }
LABEL_54:

        break;
      default:
        goto LABEL_54;
    }
  }
  else
  {
    v19 = [v5 domain];
    int v20 = [v19 isEqualToString:*MEMORY[0x263F07F70]];

    if (v20 && [v5 code] == 4097)
    {
      v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v14 = [v21 localizedStringForKey:@"NSERROR_XPC_CONNECTION_TITLE" value:&stru_26E895688 table:0];

      v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v22 localizedStringForKey:@"NSERROR_XPC_CONNECTION_MESSAGE" value:&stru_26E895688 table:0];

      id v11 = 0;
      v12 = 0;
    }
    else
    {
      id v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
    }
  }
  if ([v14 length] || objc_msgSend(v13, "length"))
  {
    v68 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    [v68 setObject:v14 forKeyedSubscript:NPHCellularErrorTitleKey];
    [v68 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08320]];
    [v68 setObject:v12 forKeyedSubscript:NPHCellularErrorLinkKey];
    [v68 setObject:v11 forKeyedSubscript:NPHCellularErrorLinkTextKey];
  }
  else
  {
    v68 = 0;
  }

  return v68;
}

+ (id)NPHCellularSanitizedError:()NPHCellularError forSubscriptionContext:
{
  v33[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = [v8 domain];
  if ([v9 isEqualToString:*MEMORY[0x263F31920]])
  {
  }
  else
  {
    v10 = [v8 domain];
    int v11 = [v10 isEqualToString:*MEMORY[0x263F07F70]];

    v12 = v8;
    if (!v11) {
      goto LABEL_16;
    }
  }
  v13 = [a1 _titleAndMessageDictForError:v8 forSubscriptionContext:v7];
  v12 = v8;
  if (v13)
  {
    v14 = objc_opt_new();
    v15 = [v8 userInfo];

    if (v15)
    {
      v16 = [v8 userInfo];
      [v14 addEntriesFromDictionary:v16];
    }
    uint64_t v17 = *MEMORY[0x263F08320];
    v33[0] = NPHCellularErrorTitleKey;
    v33[1] = v17;
    v33[2] = NPHCellularErrorLinkKey;
    v33[3] = NPHCellularErrorLinkTextKey;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v24 = objc_msgSend(v13, "objectForKeyedSubscript:", v23, (void)v28);
          [v14 setObject:v24 forKeyedSubscript:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v20);
    }

    v25 = (void *)MEMORY[0x263F087E8];
    int v26 = [v8 domain];
    v12 = objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, objc_msgSend(v8, "code"), v14);
  }
LABEL_16:

  return v12;
}

+ (uint64_t)_canControlLTEVoiceOptionsSeparately
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t result = CTSUServerConnectionRef();
  if (result)
  {
    unint64_t CanSetCapabilityExtended = _CTServerConnectionCanSetCapabilityExtended();
    unint64_t v2 = HIDWORD(CanSetCapabilityExtended);
    if (HIDWORD(CanSetCapabilityExtended))
    {
      int v3 = CanSetCapabilityExtended;
      v4 = nph_general_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v6 = "+[NSError(NPHCellularError) _canControlLTEVoiceOptionsSeparately]";
        __int16 v7 = 1024;
        int v8 = v3;
        __int16 v9 = 1024;
        int v10 = v2;
        _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "%s - Failed to check VoLTE availability error domain:%d error:%d", buf, 0x18u);
      }
    }
    return 0;
  }
  return result;
}

@end