@interface DiagnosticService
- (DiagnosticService)init;
- (void)_handlePingMessage:(id)a3 fromDevice:(id)a4;
- (void)activeClientsWithReplyHandler:(id)a3;
- (void)addSubscriberWithEndpoint:(id)a3;
- (void)pingWithReplyHandler:(id)a3;
- (void)sendCommandWithDetailedReplyHandler:(int64_t)a3 handler:(id)a4;
- (void)sendCommandWithReplyHandler:(int64_t)a3 handler:(id)a4;
@end

@implementation DiagnosticService

- (DiagnosticService)init
{
  v9.receiver = self;
  v9.super_class = (Class)DiagnosticService;
  v2 = [(DiagnosticService *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    listenerConnections = v2->_listenerConnections;
    v2->_listenerConnections = v3;

    v5 = objc_alloc_init(UnfairLock);
    listenerLock = v2->_listenerLock;
    v2->_listenerLock = v5;

    v7 = sub_1003177EC();
    sub_100317B58((uint64_t)v7, v2, (uint64_t)"_handlePingMessage:fromDevice:", 1);
  }
  return v2;
}

- (void)activeClientsWithReplyHandler:(id)a3
{
}

- (void)addSubscriberWithEndpoint:(id)a3
{
  id v4 = a3;
  listenerLock = self->_listenerLock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100337FB8;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  sub_100010468(listenerLock, v7);
}

- (void)pingWithReplyHandler:(id)a3
{
  v3 = (void (**)(void))a3;
  id v4 = sub_1002ED270();
  sub_1002EDDA0((uint64_t)v4, 2048);

  +[NSMutableString stringWithString:@"\nExisting coordinators:"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100338598;
  v14[3] = &unk_100524750;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v5;
  +[IXAppInstallCoordinator enumerateCoordinatorsWithError:0 usingBlock:v14];
  [v5 appendFormat:@"\n  ~ END ~"];
  [v5 appendString:@"\n\nActive installations:"];
  id v6 = sub_1003E0BA4();
  objc_super v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_1003385CC;
  v12 = &unk_100522C00;
  id v7 = v5;
  id v13 = v7;
  [v6 readUsingSession:&v9];

  objc_msgSend(v7, "appendFormat:", @"\n  ~ END ~", v9, v10, v11, v12);
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "->> %{public}@", buf, 0xCu);
  }

  v3[2](v3);
}

- (void)sendCommandWithReplyHandler:(int64_t)a3 handler:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (!os_variant_has_internal_content()) {
    goto LABEL_124;
  }
  id v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v115 = objc_opt_class();
    *(_WORD *)&v115[8] = 2048;
    int64_t v116 = a3;
    id v8 = *(id *)v115;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@]: Recieved command: %ld", buf, 0x16u);
  }
  if (a3 > 719)
  {
    if (a3 > 900)
    {
      switch(a3)
      {
        case 901:
          v16 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Testing Katana Arcade Entitlement Updates", buf, 2u);
          }

          id v17 = objc_alloc_init(_TtC9appstored6LogKey);
          v18 = +[KatanaSubscriptionCoordinator shared];
          v19 = +[ACAccountStore ams_sharedAccountStore];
          v20 = objc_msgSend(v19, "ams_activeiTunesAccount");

          id v104 = 0;
          v21 = sub_10033A074((uint64_t)self, v20, &v104);
          id v22 = v104;
          unsigned int v23 = [v18 updateSubscriptionInfoWithEntitlement:v21 account:v20 logKey:v17];
          v24 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v115 = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Testing arcade cached update with result: %{BOOL}d", buf, 8u);
          }

          v6[2](v6);
          goto LABEL_129;
        case 902:
          id v13 = objc_alloc_init(_TtC9appstored6LogKey);
          v67 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v115 = v13;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "[%@] Removing stale Katana supplemental account data for active account", buf, 0xCu);
          }

          v25 = +[KatanaSubscriptionCoordinator shared];
          unsigned int v68 = [(LogKey *)v25 removeStaleSubscriptionInfoWithLogKey:v13];
          v26 = ASDLogHandleForCategory();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_65;
          }
          *(_DWORD *)buf = 138412546;
          *(void *)v115 = v13;
          *(_WORD *)&v115[8] = 1024;
          LODWORD(v116) = v68;
          v31 = "[%@] Removed stale Katana subscription info with success: %{BOOL}d";
          v32 = v26;
          uint32_t v33 = 18;
          goto LABEL_64;
        case 903:
          id v13 = objc_alloc_init(_TtC9appstored6LogKey);
          v69 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v115 = v13;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "[%@] Migrating Katana supplemental account data for active account", buf, 0xCu);
          }

          v70 = +[ACAccountStore ams_sharedAccountStore];
          objc_msgSend(v70, "ams_activeiTunesAccount");
          v25 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue();

          v64 = +[KatanaSubscriptionCoordinator shared];
          unsigned int v71 = [v64 migrateSubscriptionStateWithAccount:v25 logKey:v13];
          v65 = ASDLogHandleForCategory();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_86;
          }
          *(_DWORD *)buf = 138412546;
          *(void *)v115 = v13;
          *(_WORD *)&v115[8] = 1024;
          LODWORD(v116) = v71;
          v72 = "[%@] Migrated Katana subscription info with success: %{BOOL}d";
          v73 = v65;
          uint32_t v74 = 18;
          goto LABEL_85;
        case 904:
          v75 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Sending arcade account event", buf, 2u);
          }

          v76 = sub_10037B958();
          sub_100381CA8((uint64_t)v76);

          ASDLogHandleForCategory();
          objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_123;
          }
          *(_WORD *)buf = 0;
          v58 = "Sent arcade account event";
          goto LABEL_74;
        default:
          if (a3 == 999)
          {
            v77 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Checking app intents", buf, 2u);
            }

            id v13 = objc_alloc_init(_TtC9appstored6LogKey);
            id v78 = objc_alloc((Class)NSDateInterval);
            v79 = +[NSDate distantPast];
            v80 = +[NSDate distantFuture];
            v25 = (_TtC9appstored6LogKey *)[v78 initWithStartDate:v79 endDate:v80];

            v81 = [_TtC9appstored7Intents alloc];
            v64 = [(Intents *)v81 intentUsageWithDateInterval:v25 logKey:v13];

            v65 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              id v82 = [v64 count];
              *(_DWORD *)buf = 134217984;
              *(void *)v115 = v82;
              v72 = "Checked app intents returned: %lu launches";
              v73 = v65;
              uint32_t v74 = 12;
LABEL_85:
              _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, v72, buf, v74);
            }
LABEL_86:

            v6[2](v6);
          }
          else
          {
            if (a3 != 1001) {
              goto LABEL_45;
            }
            v38 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Checking for one account", buf, 2u);
            }

            v39 = objc_alloc_init(_TtC9appstored6LogKey);
            v40 = +[ACAccountStore ams_sharedAccountStore];
            objc_msgSend(v40, "ams_activeiTunesAccount");
            id v13 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue();

            v41 = [_TtC9appstored23AccountCacheCoordinator alloc];
            v101[0] = _NSConcreteStackBlock;
            v101[1] = 3221225472;
            v101[2] = sub_10033A2EC;
            v101[3] = &unk_100528A48;
            v102 = v39;
            v103 = v6;
            v25 = v39;
            [(AccountCacheCoordinator *)v41 oneAccountDSID:v13 logKey:v25 completionHandler:v101];

            v42 = v102;
LABEL_88:
          }
          break;
      }
      goto LABEL_89;
    }
    if (a3 > 729)
    {
      switch(a3)
      {
        case 730:
          uint64_t v10 = [AnonymousPingTask alloc];
          v11 = +[NSURL URLWithString:@"https://xp.apple.com/report/2/xp_app_buy?clientId=0&sf=143441&adamId=123"];
          v113 = v11;
          v12 = +[NSArray arrayWithObjects:&v113 count:1];
          id v13 = (_TtC9appstored6LogKey *)sub_10041EAA0(v10, v12);

          v14 = sub_1002B2A3C();
          v112 = v13;
          id v15 = +[NSArray arrayWithObjects:&v112 count:1];
          if (v14) {
            [(objc_class *)v14[1].isa addOperations:v15 waitUntilFinished:1];
          }
          goto LABEL_80;
        case 740:
          ASDLogHandleForCategory();
          objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_123;
          }
          int v59 = sub_1003A4D28();
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v115 = v59;
          v58 = "HRNMode: %d";
          p_super = &v9->super;
          uint32_t v61 = 8;
          goto LABEL_75;
        case 741:
          sub_1003A5278();
          ASDLogHandleForCategory();
          objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_123;
          }
          *(_WORD *)buf = 0;
          v58 = "Invalidated HRN cache";
          goto LABEL_74;
        case 742:
          self;
          qword_1005B1F98 = -2;
          ASDLogHandleForCategory();
          objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_123;
          }
          *(_WORD *)buf = 0;
          v58 = "Cleared out activation record override";
          goto LABEL_74;
        case 743:
          self;
          qword_1005B1F98 = 1;
          ASDLogHandleForCategory();
          objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_123;
          }
          *(_WORD *)buf = 0;
          v58 = "Set HRN activation record override on";
          goto LABEL_74;
        case 744:
          self;
          qword_1005B1F98 = -1;
          ASDLogHandleForCategory();
          objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_123;
          }
          *(_WORD *)buf = 0;
          v58 = "Set HRN activation record override off";
          goto LABEL_74;
        case 745:
          v62 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Set converting install to factory ledger event", buf, 2u);
          }

          v63 = sub_1002D7CE8();
          sub_1002D90A8((uint64_t)v63, &off_10054DF98);

          id v13 = (_TtC9appstored6LogKey *)[objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.Pages" allowPlaceholder:0 error:0];
          v25 = objc_alloc_init(_TtC9appstored6LogKey);
          v64 = sub_1003D9D90([AppLedgerEvent alloc], v13, v25);
          v65 = sub_1002D7CE8();
          v111 = v64;
          v66 = +[NSArray arrayWithObjects:&v111 count:1];
          sub_1002D84A8((uint64_t)v65, v66);

          goto LABEL_86;
        default:
          goto LABEL_45;
      }
    }
    switch(a3)
    {
      case 720:
        v34 = +[NSURL URLWithString:@"http://www.apple.com"];
        v35 = &stru_10052E4D8;
        break;
      case 721:
        v34 = +[NSURL URLWithString:@"http://www.apple.com"];
        v35 = @"Some app";
        break;
      case 722:
        v34 = +[NSURL URLWithString:@"http://www.apple.com"];
        v35 = @"Some app";
        v36 = v34;
        unint64_t v37 = 2;
        goto LABEL_79;
      default:
        goto LABEL_45;
    }
    v36 = v34;
    unint64_t v37 = 1;
LABEL_79:
    sub_1002F2F18((uint64_t)UPPManifestDialogRequest, v36, v35, v37);
    id v13 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue();

    v14 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v13];
    id v15 = [v14 present];
    [v15 waitUntilFinishedWithTimeout:120.0];
LABEL_80:

    goto LABEL_127;
  }
  if (a3 > 299)
  {
    switch(a3)
    {
      case 601:
        sub_1002ED270();
        objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
        sub_1002EDDA0((uint64_t)v9, 256);
        goto LABEL_123;
      case 602:
        v83 = +[ACAccountStore ams_sharedAccountStore];
        objc_msgSend(v83, "ams_activeiTunesAccount");
        v84 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue();

        id v13 = (_TtC9appstored6LogKey *)sub_1003FAE5C([AuthorizeMachine alloc], v84, 2);
        v105[0] = _NSConcreteStackBlock;
        v105[1] = 3221225472;
        v105[2] = sub_100339F4C;
        v105[3] = &unk_100521C18;
        v106 = v84;
        v107 = v6;
        v25 = v84;
        sub_1003FB5B4((id *)&v13->super.isa, v105);

        v42 = v106;
        goto LABEL_88;
      case 603:
        sub_1002B3410();
        objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
        sub_1002BBBC0((uint64_t)v9, &off_10054E2C0);
        goto LABEL_123;
      case 604:
        uint64_t v85 = sub_1002B3410();
        objc_super v9 = (AppUsageManager *)v85;
        v86 = &off_10054C960;
        goto LABEL_93;
      case 605:
        uint64_t v85 = sub_1002B3410();
        objc_super v9 = (AppUsageManager *)v85;
        v86 = &off_10054C978;
LABEL_93:
        sub_1002B4EB0(v85, v86);
        goto LABEL_123;
      case 606:
        sub_1002B3410();
        objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
        sub_1002BC4B8((uint64_t)v9);
        goto LABEL_123;
      case 607:
      case 608:
      case 609:
        goto LABEL_45;
      case 610:
        uint64_t v87 = sub_1002B3410();
        objc_super v9 = (AppUsageManager *)v87;
        char v88 = 1;
        goto LABEL_120;
      case 611:
        sub_1002B3410();
        objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
        sub_1002B3984((uint64_t)v9, 1);
        goto LABEL_123;
      case 612:
        sub_1002B3410();
        objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
        sub_1002B9804(v9, 1u);
        goto LABEL_123;
      case 613:
        v89 = +[ACAccountStore ams_sharedAccountStore];
        objc_msgSend(v89, "ams_activeiTunesAccount");
        id v13 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue();

        v90 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v115 = v13;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Kicking retry restores for  %@", buf, 0xCu);
        }

        v14 = sub_1002B3410();
        sub_1002B7108((uint64_t)v14, v13, 0);
        goto LABEL_127;
      case 614:
        v91 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "Logging commonly usage apps", buf, 2u);
        }

        objc_super v9 = objc_alloc_init(AppUsageManager);
        id v92 = sub_1002CBAAC((uint64_t)v9);
        goto LABEL_123;
      case 615:
        v93 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Persisting commonly usage apps", buf, 2u);
        }

        objc_super v9 = objc_alloc_init(AppUsageManager);
        sub_1002CBC30((uint64_t)v9);
        goto LABEL_123;
      case 616:
        v94 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Install distributor if needed - with app", buf, 2u);
        }

        id v13 = objc_alloc_init(_TtC9appstored6LogKey);
        uint64_t v95 = sub_1002B3410();
        v14 = v95;
        v96 = @"com.dreamgames.royalmatch";
        v97 = v13;
        goto LABEL_113;
      case 617:
        v98 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Install distributor if needed - generic", buf, 2u);
        }

        id v13 = objc_alloc_init(_TtC9appstored6LogKey);
        uint64_t v95 = sub_1002B3410();
        v14 = v95;
        v97 = v13;
        v96 = 0;
LABEL_113:
        sub_1002B5148(v95, v97, v96, 0);
        goto LABEL_127;
      case 618:
        v99 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "Retrying restores requiring distributor", buf, 2u);
        }

        sub_1002B3410();
        objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
        sub_1002B7774((uint64_t)v9);
        goto LABEL_123;
      case 619:
        v100 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Bootstrap Restores", buf, 2u);
        }

        uint64_t v87 = sub_1002B3410();
        objc_super v9 = (AppUsageManager *)v87;
        char v88 = 0;
LABEL_120:
        sub_1002B4918(v87, @"Diagnostic", 0, v88);
        goto LABEL_123;
      default:
        if (a3 == 300)
        {
          sub_100213454();
          v43 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
          objc_super v9 = v43;
          uint64_t v44 = 0;
        }
        else
        {
          if (a3 != 301) {
            goto LABEL_45;
          }
          sub_100213454();
          v43 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
          objc_super v9 = v43;
          uint64_t v44 = 1;
        }
        [(AppUsageManager *)v43 checkStoreQueue:v44];
        break;
    }
    goto LABEL_123;
  }
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (a3 == 100)
      {
        sub_100354F64();
        id v13 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue();
        sub_100259614();
        v25 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue();
        v26 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v27 = [(LogKey *)v25 isConnected];
          unsigned int v28 = [(LogKey *)v25 isExpensive];
          unsigned int v29 = [(LogKey *)v25 isConstrained];
          unsigned int v30 = sub_100355370(v13);
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)v115 = v27;
          *(_WORD *)&v115[4] = 1024;
          *(_DWORD *)&v115[6] = v28;
          LOWORD(v116) = 1024;
          *(_DWORD *)((char *)&v116 + 2) = v29;
          HIWORD(v116) = 1024;
          unsigned int v117 = v30;
          v31 = "NETWORK: isConnected = %{BOOL}d, isExpensive = %{BOOL}d, isConstrained = %{BOOL}d, isRoaming = %{BOOL}d";
          v32 = v26;
          uint32_t v33 = 26;
LABEL_64:
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
        }
LABEL_65:

        v6[2](v6);
LABEL_89:

LABEL_128:
        goto LABEL_129;
      }
LABEL_45:
      ASDLogHandleForCategory();
      objc_super v9 = (AppUsageManager *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v58 = "Command not supported";
LABEL_74:
        p_super = &v9->super;
        uint32_t v61 = 2;
LABEL_75:
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, v58, buf, v61);
      }
      goto LABEL_123;
    }
    id v47 = sub_1003177EC();
    v48 = sub_1002DC980();
    sub_1002DCAAC((uint64_t)v48);
    id v13 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v49 = objc_alloc_init(XDCPingMessage);
      v50 = +[NSUUID UUID];
      v51 = [v50 UUIDString];
      sub_1002974E0((uint64_t)v49, v51);

      v52 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        if (v49) {
          uuid = v49->_uuid;
        }
        else {
          uuid = 0;
        }
        v54 = uuid;
        *(_DWORD *)buf = 138543362;
        *(void *)v115 = v54;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ >> SENDING PING", buf, 0xCu);
      }
      id v55 = sub_1003690D8([XDCMessage alloc], v49, 1);
      v56 = sub_1003177EC();
      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472;
      v108[2] = sub_100339D78;
      v108[3] = &unk_100528100;
      v109 = v49;
      v110 = v6;
      v57 = v49;
      if (v56) {
        sub_100317CB4((uint64_t)v56, v55, v13, 1, v108);
      }

      goto LABEL_128;
    }
    v14 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No active paired device is available", buf, 2u);
    }
LABEL_127:

    v6[2](v6);
    goto LABEL_128;
  }
  v45 = sub_10030B11C();
  id v46 = [v45 URLForKey:@"app-receipt-create"];

  objc_super v9 = +[NSNotificationCenter defaultCenter];
  [(AppUsageManager *)v9 postNotificationName:AMSBagChangedNotification object:&__NSDictionary0__struct];
LABEL_123:

LABEL_124:
  v6[2](v6);
LABEL_129:
}

- (void)sendCommandWithDetailedReplyHandler:(int64_t)a3 handler:(id)a4
{
  v65 = (void (**)(id, void *))a4;
  if ((os_variant_has_internal_content() & 1) == 0)
  {
    id v5 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client not supported", (uint8_t *)&buf, 2u);
    }
  }
  id v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Recieved detailed command: %ld", (uint8_t *)&buf, 0xCu);
  }

  if (a3 > 804)
  {
    if (a3 <= 819)
    {
      switch(a3)
      {
        case 805:
          v42 = objc_alloc_init(AppPurgeCoordinator);
          sub_10021F730((uint64_t)v42);
          v65[2](v65, &__NSDictionary0__struct);

          goto LABEL_72;
        case 806:
          v43 = objc_alloc_init(AppPurgeCoordinator);
          uint64_t v44 = sub_10021A568(v43, 1);
          v65[2](v65, v44);

          goto LABEL_72;
        case 810:
          unsigned int v27 = objc_alloc_init(AppPurgeCoordinator);
          unsigned int v28 = +[NSMutableDictionary dictionary];
          sub_10021C63C((uint64_t)v27, v28, 1);
          v65[2](v65, v28);

          goto LABEL_72;
      }
      goto LABEL_56;
    }
    if (a3 > 859)
    {
      if (a3 == 860)
      {
        v45 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Clearing optimal download windows from automatic updates", (uint8_t *)&buf, 2u);
        }

        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v81 = 0x3032000000;
        id v82 = sub_100018238;
        v83 = sub_100017CD8;
        id v84 = (id)objc_opt_new();
        id v46 = sub_1003E0BA4();
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472;
        v69[2] = sub_10033B428;
        v69[3] = &unk_100523CF8;
        v69[4] = &buf;
        [v46 modifyUsingTransaction:v69];

        if ([*(id *)(*((void *)&buf + 1) + 40) count])
        {
          id v47 = sub_1002ED270();
          sub_1002EDDA0((uint64_t)v47, 128);
        }
        uint64_t v48 = *(void *)(*((void *)&buf + 1) + 40);
        CFStringRef v78 = @"optimalDownloadWindowsCleared";
        uint64_t v79 = v48;
        v49 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        v65[2](v65, v49);

        _Block_object_dispose(&buf, 8);
      }
      else
      {
        if (a3 != 870) {
          goto LABEL_56;
        }
        unsigned int v29 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Expiring app asset download URLs", (uint8_t *)&buf, 2u);
        }

        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v81 = 0x3032000000;
        id v82 = sub_100018238;
        v83 = sub_100017CD8;
        id v84 = &__NSArray0__struct;
        unsigned int v30 = sub_1003E0BA4();
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_10033B6F4;
        v68[3] = &unk_100523CF8;
        v68[4] = &buf;
        [v30 modifyUsingTransaction:v68];

        uint64_t v31 = *(void *)(*((void *)&buf + 1) + 40);
        CFStringRef v76 = @"assetDownloadsExpired";
        uint64_t v77 = v31;
        v32 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        v65[2](v65, v32);

        _Block_object_dispose(&buf, 8);
      }
    }
    else if (a3 == 820)
    {
      v38 = objc_alloc_init(VerifyReceiptsTask);
      v39 = v38;
      if (v38) {
        v38->_refreshStoreOriginated = 1;
      }
      uint64_t v40 = sub_1002B2A3C();
      v41 = (void *)v40;
      if (v40) {
        [*(id *)(v40 + 8) addOperation:v39];
      }

      v65[2](v65, &__NSDictionary0__struct);
    }
    else
    {
      if (a3 != 821) {
        goto LABEL_56;
      }
      v21 = sub_1003BE780([HandleInvalidReceiptTask alloc], @"com.shazam.Shazam");
      sub_1002B2A3C();
      id v22 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v85 = v21;
      unsigned int v23 = +[NSArray arrayWithObjects:&v85 count:1];
      if (v22) {
        [v22[1] addOperations:v23 waitUntilFinished:1];
      }

      v65[2](v65, &__NSDictionary0__struct);
    }
  }
  else
  {
    if (a3 <= 599)
    {
      switch(a3)
      {
        case 100:
          CFStringRef v95 = @"ledger";
          uint32_t v33 = +[QALogger serializeLedger];
          v96 = v33;
          v34 = +[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
          v65[2](v65, v34);

          goto LABEL_72;
        case 411:
          CFStringRef v93 = @"installs";
          v35 = sub_1002ED270();
          v36 = sub_1002EE3FC(v35);
          v94 = v36;
          unint64_t v37 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
          v65[2](v65, v37);

          goto LABEL_72;
        case 412:
          id v67 = objc_alloc_init((Class)NSMutableDictionary);
          v64 = sub_100259614();
          v91[0] = @"isConnected";
          id v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v64 isConnected]);
          v92[0] = v7;
          v91[1] = @"isConstrained";
          id v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v64 isConstrained]);
          v92[1] = v8;
          v91[2] = @"isExpensive";
          objc_super v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v64 isExpensive]);
          v92[2] = v9;
          v91[3] = @"interfaceType";
          uint64_t v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v64 interfaceType]);
          v92[3] = v10;
          v11 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:4];
          [v67 setObject:v11 forKeyedSubscript:@"default"];

          long long v74 = 0u;
          long long v75 = 0u;
          long long v73 = 0u;
          long long v72 = 0u;
          id v12 = [&off_10054DFB0 countByEnumeratingWithState:&v72 objects:v90 count:16];
          if (v12)
          {
            uint64_t v66 = *(void *)v73;
            do
            {
              for (i = 0; i != v12; i = (char *)i + 1)
              {
                if (*(void *)v73 != v66) {
                  objc_enumerationMutation(&off_10054DFB0);
                }
                v14 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                id v15 = sub_100259888((uint64_t)NetworkMonitor, v14);
                v88[0] = @"isConnected";
                v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 isConnected]);
                v89[0] = v16;
                v88[1] = @"isConstrained";
                id v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 isConstrained]);
                v89[1] = v17;
                v88[2] = @"isExpensive";
                v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 isExpensive]);
                v89[2] = v18;
                v88[3] = @"interfaceType";
                v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 interfaceType]);
                v89[3] = v19;
                v20 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:4];
                [v67 setObject:v20 forKeyedSubscript:v14];
              }
              id v12 = [&off_10054DFB0 countByEnumeratingWithState:&v72 objects:v90 count:16];
            }
            while (v12);
          }
          v65[2](v65, v67);

          goto LABEL_72;
      }
LABEL_56:
      v65[2](v65, &__NSDictionary0__struct);
      goto LABEL_72;
    }
    switch(a3)
    {
      case 613:
        v24 = sub_1002188DC();
        v25 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
        }

        v26 = sub_100219B50(v24);
        v65[2](v65, v26);

        break;
      case 614:
        goto LABEL_56;
      case 615:
        id v55 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Terminating Arcade apps", (uint8_t *)&buf, 2u);
        }

        uint64_t v56 = sub_10037B958();
        v57 = (void *)v56;
        if (v56) {
          sub_1003822C4(v56);
        }

        v58 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Terminating Arcade apps request complete", (uint8_t *)&buf, 2u);
        }
        goto LABEL_63;
      case 616:
        int v59 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Testing Arcade times", (uint8_t *)&buf, 2u);
        }

        sub_100219E04();
        v58 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Testing Arcade times complete", (uint8_t *)&buf, 2u);
        }
LABEL_63:

        v65[2](v65, &__NSDictionary0__struct);
        break;
      case 617:
        v60 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Testing sbsync if subscribed", (uint8_t *)&buf, 2u);
        }

        uint32_t v61 = +[ACAccountStore ams_sharedAccountStore];
        v62 = objc_msgSend(v61, "ams_activeiTunesAccount");

        v63 = sub_10037B958();
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472;
        v70[2] = sub_10033B3A0;
        v70[3] = &unk_1005230F0;
        unsigned int v71 = v65;
        sub_10037EAC4((uint64_t)v63, v62, v70);

        break;
      default:
        if (a3 != 600) {
          goto LABEL_56;
        }
        v86[0] = @"restore";
        v50 = sub_1002B3410();
        v51 = sub_1002B6B70((uint64_t)v50);
        v86[1] = @"installs";
        v87[0] = v51;
        v52 = sub_1002ED270();
        v53 = sub_1002EE3FC(v52);
        v87[1] = v53;
        v54 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];
        v65[2](v65, v54);

        break;
    }
  }
LABEL_72:
}

- (void)_handlePingMessage:(id)a3 fromDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = [XDCPingMessage alloc];
  if (v5) {
    id Property = objc_getProperty(v5, v7, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v11 = [(XDCPingMessage *)v8 initWithData:v10];

  id v12 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      uuid = v11->_uuid;
    }
    else {
      uuid = 0;
    }
    v14 = uuid;
    int v21 = 138543618;
    id v22 = v14;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ >> RECEIVED PING FROM %{public}@", (uint8_t *)&v21, 0x16u);
  }
  id v15 = objc_alloc_init(XDCPingMessage);
  if (v11) {
    v16 = v11->_uuid;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;
  sub_1002974E0((uint64_t)v15, v17);

  v18 = sub_10036927C((uint64_t)v5, v15, 1);
  uint64_t v19 = sub_1003177EC();
  v20 = (void *)v19;
  if (v19) {
    sub_100317CB4(v19, v18, v6, 0, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerLock, 0);
  objc_storeStrong((id *)&self->_listenerConnections, 0);
}

@end