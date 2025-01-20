uint64_t sub_1000034F8(uint64_t a1)
{
  uint64_t result;

  result = *(void *)(*(void *)(a1 + 32) + 8);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100003954(void *a1, void *a2)
{
  id v3 = a2;
  v4 = _AAUILogSystem();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100006EA4((uint64_t)v3, v5);
    }

    if ((objc_msgSend(v3, "aa_isAAErrorWithCode:", -1) & 1) == 0)
    {
      v6 = _AAUILogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_100006E64();
      }

      v7 = +[LSApplicationWorkspace defaultWorkspace];
      [v7 openURL:a1[4] withOptions:0];

      uint64_t v8 = *(void *)(a1[5] + 8);
      if (v8) {
        (*(void (**)(void))(v8 + 16))();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[6];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully presented Custodian Invitation UI for UUID - %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

void sub_100003BCC(void *a1, void *a2)
{
  id v3 = a2;
  v4 = _AAUILogSystem();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100006F1C((uint64_t)v3, v5);
    }

    if ((objc_msgSend(v3, "aa_isAAErrorWithCode:", -1) & 1) == 0)
    {
      v6 = _AAUILogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_100006E64();
      }

      v7 = +[LSApplicationWorkspace defaultWorkspace];
      [v7 openURL:a1[4] withOptions:0];

      uint64_t v8 = *(void *)(a1[5] + 8);
      if (v8) {
        (*(void (**)(void))(v8 + 16))();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[6];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully presented Inheritance Invitation UI for beneficiaryID - %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

void sub_1000041E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100004204(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = _AAUILogSystem();
  uint64_t v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully verified manatee. Displaying invitation.", v11, 2u);
    }

    id v10 = objc_loadWeakRetained(v6);
    [v10 presentViewController:WeakRetained[6] animated:1 completion:0];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100006FC8();
    }

    id v10 = objc_loadWeakRetained(v6);
    [v10 _callCompletionWithError:v5];
  }
}

void sub_100004AEC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) remoteContextInfo];

  id v3 = _AALogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote context found. Proceeding to launch the authorization flow.", buf, 2u);
    }

    id v5 = *(void **)(a1 + 32);
    v6 = [v5 xpcEndpoint];
    [v5 setUpLookupConnection:v6];

    v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v7 remoteContextInfo];
    [v7 _buildViewModelWithContextInfo:v8];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "No remote context found. Failed to launch the flow.", v9, 2u);
    }

    [*(id *)(a1 + 32) notifyFlowCompletionToExitScene];
  }
}

void sub_100004DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004DFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000072A0();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAndExit];
}

id sub_10000528C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissAndExit];
}

void sub_1000052E8(id a1)
{
  v1 = _AAUILogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Exiting hidden app process.", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = +[UIApplication sharedApplication];
  id v3 = [v2 openSessions];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        uint64_t v9 = +[UIApplication sharedApplication];
        [v9 requestSceneSessionDestruction:v8 options:0 errorHandler:0];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }

  exit(0);
}

id sub_1000054A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _main_dismissAndExit];
}

id sub_100005598(uint64_t a1)
{
  [*(id *)(a1 + 32) setWelcomeController:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 endUIService];
}

uint64_t sub_1000055D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000057A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000057B8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _AAUILogSystem();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee state has been verified.", v9, 2u);
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007370();
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

void sub_100005978(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_100005994(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (a2) {
    [WeakRetained _respondToInheritanceInvitationWithResponse:1];
  }
  else {
    [WeakRetained _callCompletionWithError:v7];
  }
}

void sub_100005BEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000073D8();
    }

    id v5 = *(void **)(a1 + 32);
    id v6 = v3;
  }
  else
  {
    [*(id *)(a1 + 32) _dismissBeneficiaryInvitationReminderFollowUp];
    id v5 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 40))
    {
      [v5 _showInheritanceInvitationAcceptedView];
      goto LABEL_8;
    }
    id v6 = 0;
  }
  [v5 _callCompletionWithError:v6];
LABEL_8:
}

void sub_100005D84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100005DA0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee state has been verified.", v9, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _respondToCustodianInvitationWithResponse:1];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007370();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _callCompletionWithError:v5];
  }
}

void sub_100006010(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100007440();
    }

    id v5 = *(void **)(a1 + 32);
    id v6 = v3;
  }
  else
  {
    [*(id *)(a1 + 32) _dismissCustodianInvitationReminderFollowUp];
    id v5 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 40))
    {
      [v5 _showCustodianInvitationAcceptedView];
      goto LABEL_8;
    }
    id v6 = 0;
  }
  [v5 _callCompletionWithError:v6];
LABEL_8:
}

void sub_100006190(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc((Class)AACustodianshipInfo);
    id v3 = [WeakRetained[5] custodianshipInfo];
    id v4 = [v3 custodianID];
    id v5 = [WeakRetained[5] custodianshipInfo];
    id v6 = [v5 ownerHandle];
    id v7 = [v2 initWithID:v4 status:2 ownerHandle:v6];

    id v8 = [objc_alloc((Class)AAOBCustodianInvitationModel) initWithCustodianshipInfo:v7];
    id v9 = [objc_alloc((Class)AAUIOBCustodianInvitationModel) initWithModel:v8];
    id v10 = [objc_alloc((Class)AAUIOBWelcomeController) initWithViewModel:v9];
    long long v11 = [v10 secondaryButton];
    [v11 addTarget:WeakRetained action:"_goToAccountRecoverySettings" forEvents:64];

    [v10 setDelegate:WeakRetained];
    [WeakRetained[6] presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000074A8();
    }
  }
}

void sub_100006400(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc((Class)AACustodianshipInfo);
    id v3 = [WeakRetained[5] custodianshipInfo];
    id v4 = [v3 custodianID];
    id v5 = [WeakRetained[5] custodianshipInfo];
    id v6 = [v5 ownerHandle];
    id v7 = [v2 initWithID:v4 status:2 ownerHandle:v6];

    id v8 = [objc_alloc((Class)AAOBInheritanceInvitationModel) initWithAcceptedViewForBenefactorInfo:v7];
    id v9 = [objc_alloc((Class)AAUIOBInheritanceInvitationViewModel) initWithModel:v8];
    id v10 = [objc_alloc((Class)AAUIOBWelcomeController) initWithViewModel:v9];
    long long v11 = [v10 secondaryButton];
    [v11 addTarget:WeakRetained action:"_goToAccountBeneficiarySettings" forEvents:64];

    [v10 setDelegate:WeakRetained];
    [WeakRetained[6] presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000074DC();
    }
  }
}

void sub_100006670(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  id v5 = _AAUILogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100007578();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissed followup? %d", (uint8_t *)v7, 8u);
  }
}

void sub_100006878(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  id v5 = _AAUILogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100007578();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissed followup? %d", (uint8_t *)v7, 8u);
  }
}

void sub_100006C0C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100006C28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006C50(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100006C6C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006CA4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100006DE4()
{
  sub_100003F28();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to build info from activity.", v1, 2u);
}

void sub_100006E24()
{
  sub_100003F28();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to find flow from info.", v1, 2u);
}

void sub_100006E64()
{
  sub_100003F28();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Attempting to launch web browser with fallback URL...", v1, 2u);
}

void sub_100006EA4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "displayInvitationUIWithUUID completed with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100006F1C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "presentInheritanceInvitationUIWithBeneficiaryID completed with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100006F94()
{
  sub_100003F28();
  sub_100006C6C((void *)&_mh_execute_header, v0, v1, "Welcome controller already being shown; ignoring",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100006FC8()
{
  sub_100006C44();
  sub_100006C28((void *)&_mh_execute_header, v0, v1, "Failed to verify CDP for messages invitation - Error: %@", v2, v3, v4, v5, v6);
}

void sub_100007030()
{
  sub_100003F28();
  sub_100006C6C((void *)&_mh_execute_header, v0, v1, "Missing model data", v2, v3, v4, v5, v6);
}

void sub_100007064()
{
  sub_100006C44();
  sub_100006C28((void *)&_mh_execute_header, v0, v1, "Error returned unarchiving with model data: %@", v2, v3, v4, v5, v6);
}

void sub_1000070CC()
{
  sub_100003F28();
  sub_100006C0C((void *)&_mh_execute_header, v0, v1, "LCInvite: Configuring View for pending Inheritance Invitation Model", v2, v3, v4, v5, v6);
}

void sub_100007100()
{
  sub_100003F28();
  sub_100006C0C((void *)&_mh_execute_header, v0, v1, "LCInvite: Configuring View for non-pending Inheritance Invitation Model", v2, v3, v4, v5, v6);
}

void sub_100007134()
{
  sub_100003F28();
  sub_100006C0C((void *)&_mh_execute_header, v0, v1, "Providing means for custodianship acceptance.", v2, v3, v4, v5, v6);
}

void sub_100007168()
{
  sub_100003F28();
  sub_100006C0C((void *)&_mh_execute_header, v0, v1, "Providing means to decline custodianship for ineligible contact.", v2, v3, v4, v5, v6);
}

void sub_10000719C()
{
  sub_100003F28();
  sub_100006C0C((void *)&_mh_execute_header, v0, v1, "Providing means for custodianship management.", v2, v3, v4, v5, v6);
}

void sub_1000071D0()
{
  sub_100003F28();
  sub_100006C0C((void *)&_mh_execute_header, v0, v1, "Showing Custodian Model", v2, v3, v4, v5, v6);
}

void sub_100007204()
{
  sub_100006C44();
  sub_100006C50((void *)&_mh_execute_header, v0, v1, "Setting up look up connection with endpoint %@", v2, v3, v4, v5, v6);
}

void sub_10000726C()
{
  sub_100003F28();
  sub_100006C0C((void *)&_mh_execute_header, v0, v1, "Setting up look up host proxy", v2, v3, v4, v5, v6);
}

void sub_1000072A0()
{
  sub_100006C44();
  sub_100006C28((void *)&_mh_execute_header, v0, v1, "Lookup for remote proxy object failed with rror %@", v2, v3, v4, v5, v6);
}

void sub_100007308()
{
  sub_100006C44();
  sub_100006C50((void *)&_mh_execute_header, v0, v1, "%@ deallocated", v2, v3, v4, v5, v6);
}

void sub_100007370()
{
  sub_100006C44();
  sub_100006C28((void *)&_mh_execute_header, v0, v1, "Unable to repair manatee state with error: %@", v2, v3, v4, v5, v6);
}

void sub_1000073D8()
{
  sub_100006C44();
  sub_100006C28((void *)&_mh_execute_header, v0, v1, "Error occurred while responding to the Inheritance invite: %@", v2, v3, v4, v5, v6);
}

void sub_100007440()
{
  sub_100006C44();
  sub_100006C28((void *)&_mh_execute_header, v0, v1, "Error occurred while responding to the invite: %@", v2, v3, v4, v5, v6);
}

void sub_1000074A8()
{
  sub_100003F28();
  sub_100006C6C((void *)&_mh_execute_header, v0, v1, "Missing strongSelf. Not showing Custodian Invitation Accepted View", v2, v3, v4, v5, v6);
}

void sub_1000074DC()
{
  sub_100003F28();
  sub_100006C6C((void *)&_mh_execute_header, v0, v1, "Missing strongSelf. Not showing Inheritance Invitation Accepted View", v2, v3, v4, v5, v6);
}

void sub_100007510()
{
  sub_100006C44();
  sub_100006C50((void *)&_mh_execute_header, v0, v1, "Dismissing followup with ID - %@", v2, v3, v4, v5, v6);
}

void sub_100007578()
{
  sub_100006C88();
  sub_100006CA4((void *)&_mh_execute_header, v0, v1, "Dismissed followup? %d, with error: %@");
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _AALogSystem()
{
  return __AALogSystem();
}

uint64_t _AAUILogSystem()
{
  return __AAUILogSystem();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
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
  return [super a2];
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__dismissAndExit(void *a1, const char *a2, ...)
{
  return [a1 _dismissAndExit];
}

id objc_msgSend__dismissBeneficiaryInvitationReminderFollowUp(void *a1, const char *a2, ...)
{
  return [a1 _dismissBeneficiaryInvitationReminderFollowUp];
}

id objc_msgSend__dismissCustodianInvitationReminderFollowUp(void *a1, const char *a2, ...)
{
  return [a1 _dismissCustodianInvitationReminderFollowUp];
}

id objc_msgSend__invalidateLookupConnection(void *a1, const char *a2, ...)
{
  return [a1 _invalidateLookupConnection];
}

id objc_msgSend__openCustomDomainManageURL(void *a1, const char *a2, ...)
{
  return [a1 _openCustomDomainManageURL];
}

id objc_msgSend__openPrivateEmailManageURL(void *a1, const char *a2, ...)
{
  return [a1 _openPrivateEmailManageURL];
}

id objc_msgSend__prepareMessagesInvitation(void *a1, const char *a2, ...)
{
  return [a1 _prepareMessagesInvitation];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend__setupRemoteProxy(void *a1, const char *a2, ...)
{
  return [a1 _setupRemoteProxy];
}

id objc_msgSend__showCustodianInvitationAcceptedView(void *a1, const char *a2, ...)
{
  return [a1 _showCustodianInvitationAcceptedView];
}

id objc_msgSend__showInheritanceInvitationAcceptedView(void *a1, const char *a2, ...)
{
  return [a1 _showInheritanceInvitationAcceptedView];
}

id objc_msgSend__showInvitedAsFlow(void *a1, const char *a2, ...)
{
  return [a1 _showInvitedAsFlow];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_custodianID(void *a1, const char *a2, ...)
{
  return [a1 custodianID];
}

id objc_msgSend_custodianshipInfo(void *a1, const char *a2, ...)
{
  return [a1 custodianshipInfo];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_notifyFlowCompletionToExitScene(void *a1, const char *a2, ...)
{
  return [a1 notifyFlowCompletionToExitScene];
}

id objc_msgSend_openSessions(void *a1, const char *a2, ...)
{
  return [a1 openSessions];
}

id objc_msgSend_ownerHandle(void *a1, const char *a2, ...)
{
  return [a1 ownerHandle];
}

id objc_msgSend_prepareViewServiceForPresentation(void *a1, const char *a2, ...)
{
  return [a1 prepareViewServiceForPresentation];
}

id objc_msgSend_primaryButton(void *a1, const char *a2, ...)
{
  return [a1 primaryButton];
}

id objc_msgSend_remoteContextInfo(void *a1, const char *a2, ...)
{
  return [a1 remoteContextInfo];
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectInterface];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_secondaryButton(void *a1, const char *a2, ...)
{
  return [a1 secondaryButton];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return [a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_setUpHostProxy(void *a1, const char *a2, ...)
{
  return [a1 setUpHostProxy];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}