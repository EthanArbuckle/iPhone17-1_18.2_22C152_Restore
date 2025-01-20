void sub_30CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_30E8(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    id v5 = WeakRetained;
    [WeakRetained setCurrentScreen:v4];
    id WeakRetained = v5;
  }
}

id sub_3144(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentScreen:1];
}

id sub_31F8(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Restricting settings to shield", v4, 2u);
  }

  return [*(id *)(a1 + 32) setCurrentScreen:3];
}

id sub_3994(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetToRootAnimated:0];
}

void sub_438C(uint64_t a1)
{
  PKFeatureIdentifierToString();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v3, 0);
  [*(id *)(*(void *)(a1 + 32) + 184) openPaymentSetupWithMode:4 referrerIdentifier:0 allowedFeatureIdentifiers:v2];
}

id sub_4544(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 184) refreshPasses];
}

void sub_4B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4B70(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4C40;
  block[3] = &unk_10540;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_4C40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init((Class)PKAccountViewInterfaceConfiguration);
    [v2 setAccount:*(void *)(a1 + 32)];
    [v2 setRewardsDateComponents:*(void *)(a1 + 40)];
    [v2 setDestination:9];
    [v2 setViewStyle:1];
    id v3 = [objc_alloc((Class)PKSavingsAccountViewController) initWithConfiguration:v2];
    id v4 = [WeakRetained navigationController];
    [v4 pushViewController:v3 animated:1];
  }
}

void sub_4F58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_4F7C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[23] openPaymentSetupWithMode:0 referrerIdentifier:0 allowedFeatureIdentifiers:0];
    id WeakRetained = v2;
  }
}

uint64_t sub_4FD8(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_4FF0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_5470(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_54A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5554;
  block[3] = &unk_10608;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_5554(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 184) passWithUniqueIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) _passDetailsViewControllerForPass:v2];
    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) navigationController];
      [v4 pushViewController:v3 animated:0];

      [v3 presentTransactionDetailsForTransaction:*(void *)(a1 + 48) animated:1];
    }
  }

  return _objc_release_x1();
}

void sub_5608(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_56CC;
  v6[3] = &unk_10658;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v4 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_56CC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) altDSID];
  if (!v2)
  {
    v13 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v14 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v36 = v14;
    v15 = "There is no altDSID defined for associated account %@";
    goto LABEL_22;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v4)
  {
LABEL_14:

LABEL_20:
    v13 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412290;
    v36 = v2;
    v15 = "Cannot find a family member with altDSID %@";
LABEL_22:
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    goto LABEL_23;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v31;
LABEL_4:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v31 != v6) {
      objc_enumerationMutation(v3);
    }
    id v8 = *(void **)(*((void *)&v30 + 1) + 8 * v7);
    objc_msgSend(v8, "altDSID", (void)v30);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v2;
    v11 = v10;
    if (v9 == v10) {
      break;
    }
    if (v9)
    {
      unsigned __int8 v12 = [v9 isEqualToString:v10];

      if (v12) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    if (v5 == (id)++v7)
    {
      id v5 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v5) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

LABEL_18:
  v13 = v8;

  if (!v13) {
    goto LABEL_20;
  }
  id v16 = [objc_alloc((Class)PKFamilyMemberCollection) initWithFamilyMembers:*(void *)(a1 + 40)];
  id v17 = objc_alloc((Class)PKContactAvatarManager);
  v18 = +[PKContactResolver defaultContactResolver];
  v19 = [*(id *)(*(void *)(a1 + 48) + 192) paymentDataProvider];
  id v20 = [v17 initWithContactResolver:v18 paymentDataProvider:v19];

  id v21 = objc_alloc((Class)PKPeerPaymentAssociatedAccountsController);
  v22 = [*(id *)(*(void *)(a1 + 48) + 192) passLibraryDataProvider];
  id v23 = [v21 initWithFamilyCollection:v16 avatarManager:v20 passLibraryDataProvider:v22 context:3];
  uint64_t v24 = *(void *)(a1 + 48);
  v25 = *(void **)(v24 + 200);
  *(void *)(v24 + 200) = v23;

  id v26 = [objc_alloc((Class)PKPeerPaymentAssociatedAccountPresentationContext) initWithPKFamilyMember:v13 transaction:*(void *)(a1 + 56)];
  v27 = *(void **)(a1 + 48);
  v28 = (void *)v27[25];
  v29 = [v27 navigationController];
  [v28 presentAssociatedAccountsFlowWithPresentationContext:v26 fromNavigationController:v29];

LABEL_23:
}

void sub_5A10(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5AC0;
  block[3] = &unk_10608;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_5AC0(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 184);
  id v3 = [*(id *)(a1 + 40) associatedPassUniqueID];
  uint64_t v7 = [v2 passWithUniqueIdentifier:v3];

  if (v7)
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "_passDetailsViewControllerForPass:");
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) navigationController];
      [v5 pushViewController:v4 animated:0];

      [v4 presentTransactionDetailsForTransaction:*(void *)(a1 + 48) animated:1];
    }
  }

  return _objc_release_x2();
}

void sub_5B88(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5C58;
  block[3] = &unk_10540;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_5C58(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) feature] == (char *)&dword_4 + 1)
    {
      [WeakRetained[23] showSavingsAccount:*(void *)(a1 + 32) destination:8 transaction:*(void *)(a1 + 40) fundingSource:0 animated:1];
    }
    else
    {
      id v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Attempted to present transaction details for an unsupported feature", v4, 2u);
      }
    }
  }
}

void sub_6114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v18 - 160), 8);
  _Block_object_dispose((const void *)(v18 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_6158(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_6168(uint64_t a1)
{
}

void sub_6170(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1[4] + 232);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_6254;
  v13[3] = &unk_106D0;
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[6];
  id v15 = v7;
  uint64_t v16 = v9;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 defaultAccountForFeature:v10 completion:v13];
}

void sub_6254(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40) == 0);
}

void sub_62D0(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = a1[5];
  uint64_t v9 = *(void **)(a1[4] + 232);
  uint64_t v10 = [*(id *)(*(void *)(a1[6] + 8) + 40) accountIdentifier];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_63D4;
  v14[3] = &unk_10720;
  uint64_t v11 = a1[7];
  id v16 = v7;
  uint64_t v17 = v11;
  id v15 = v6;
  id v12 = v6;
  id v13 = v7;
  [v9 paymentFundingSourceForIdentifier:v8 accountIdentifier:v10 completion:v14];
}

void sub_63D4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_6440(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (([a4 isCanceled] & 1) == 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_64F0;
    v5[3] = &unk_10770;
    objc_copyWeak(v7, (id *)(a1 + 48));
    v7[1] = *(id *)(a1 + 56);
    long long v6 = *(_OWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
    objc_destroyWeak(v7);
  }
}

void sub_64F0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = (int *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) state];
    if ((unint64_t)v3 - 1 < 3)
    {
      [v5[23] showSavingsAccount:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) destination:*(void *)(a1 + 56) transaction:0 fundingSource:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) animated:1];
LABEL_7:
      id WeakRetained = v5;
      goto LABEL_8;
    }
    BOOL v4 = v3 == &dword_4;
    id WeakRetained = v5;
    if (v4)
    {
      [v5[23] showDocumentsForClosedSavingsAccounts:0];
      goto LABEL_7;
    }
  }
LABEL_8:
}

uint64_t sub_6954(uint64_t a1, int a2, void *a3)
{
  a3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (a2)
  {
    if (v5)
    {
      id v6 = [objc_alloc((Class)PKPaymentSetupNavigationController) initWithProvisioningController:*(void *)(a1 + 32) context:3];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else if (v5)
  {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }

  return _objc_release_x3();
}

void sub_6DDC(uint64_t a1, uint64_t a2, void *a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6E90;
  block[3] = &unk_10810;
  id v7 = a3;
  id v4 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_6E90(id *a1)
{
  id v2 = a1[4];
  if (v2)
  {
    id v3 = [v2 domain];
    uint64_t v4 = AKAppleIDAuthenticationErrorDomain;
    if ([v3 isEqual:AKAppleIDAuthenticationErrorDomain])
    {
      id v5 = [a1[4] code];

      if (v5 == (id)-7003)
      {
LABEL_11:
        id v6 = (void (*)(void))*((void *)a1[6] + 2);
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v7 = [a1[4] domain];
    if ([v7 isEqual:v4])
    {
      id v8 = [a1[4] code];

      if (v8 == (id)-7005)
      {
        id v9 = PKLocalizedPaymentString(@"COULD_NOT_CONNECT_TITLE");
        uint64_t v10 = PKLocalizedPaymentString(@"COULD_NOT_CONNECT_MESSAGE");
        uint64_t v11 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];
        PKApplyDefaultIconToAlertController();
        id v12 = PKLocalizedString(@"OK_BUTTON_TITLE");
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_70B0;
        v14[3] = &unk_107E8;
        id v15 = a1[6];
        id v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v14];
        [v11 addAction:v13];

        [a1[5] presentViewController:v11 animated:0 completion:0];
        return;
      }
    }
    else
    {
    }
    goto LABEL_11;
  }
  id v6 = (void (*)(void))*((void *)a1[6] + 2);
LABEL_12:

  v6();
}

uint64_t sub_70B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_7274(uint64_t a1, void *a2)
{
  [a2 didReceiveAppAuthorizationRedirectToURL:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_73B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_73E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_74FC;
    v5[3] = &unk_10888;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    id v7 = *(id *)(a1 + 32);
    id v6 = v3;
    char v9 = *(unsigned char *)(a1 + 48);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

    objc_destroyWeak(&v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_97EC(v4);
    }
  }
}

void sub_74FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init((Class)PKPassLibrary);
    id v3 = [*(id *)(a1 + 32) fpanId];
    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) fpanId];
      id v5 = [v2 passWithFPANIdentifier:v4];
    }
    else
    {
      id v5 = 0;
    }

    [WeakRetained presentAuthorizationViewControllerWithPaymentPass:v5 session:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_78C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_78F4(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = (void *)WeakRetained[23];
      if (v5)
      {
        [WeakRetained settingsController:v6 requestsDetailViewControllerForPass:v5 animated:0];
      }
      else
      {
        id v7 = [*(id *)(a1 + 40) institution];
        id v8 = [v7 institutionIdentifier];
        [v6 showBankConnectManagementForInstitution:v8 accountIdentifier:0 sender:0 completion:0];
      }
    }
    [v9 dismissViewControllerAnimated:*(unsigned __int8 *)(a1 + 64) completion:0];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_79DC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) navigationController];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  id v7[2] = sub_7AA0;
  v7[3] = &unk_10900;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v2 presentViewController:v3 animated:v4 completion:v7];
}

uint64_t sub_7AA0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t sub_7ABC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_7CB8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 232);
  id v3 = [*(id *)(a1 + 40) feature];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_7D88;
  v6[3] = &unk_109A0;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  char v10 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  [v2 defaultAccountForFeature:v3 completion:v6];
}

void sub_7D88(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7E54;
  block[3] = &unk_10978;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  char v13 = *(unsigned char *)(a1 + 56);
  id v12 = v6;
  id v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_7E54(uint64_t a1)
{
  id v2 = objc_alloc((Class)PKPaymentProvisioningController);
  id v3 = +[PKPaymentWebService sharedService];
  id v4 = [v2 initWithWebService:v3];

  [*(id *)(a1 + 32) feature];
  uint64_t v5 = PKFeatureIdentifierToString();
  uint64_t v6 = +[NSSet setWithObject:v5];
  [v4 setAllowedFeatureIdentifiers:v6];

  id v7 = [objc_alloc((Class)PKApplyControllerConfiguration) initWithSetupDelegate:0 context:3 provisioningController:v4];
  [v7 setFeatureApplication:*(void *)(a1 + 32)];
  id v8 = [objc_alloc((Class)PKApplyController) initWithApplyConfiguration:v7];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 216);
  *(void *)(v9 + 216) = v8;

  id v11 = *(void **)(*(void *)(a1 + 40) + 216);
  id v12 = +[PKAccount analyticsAccountTypeForAccount:*(void *)(a1 + 48)];
  [v11 setAnalyticsExistingAccountType:v12];

  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = *(void **)(v13 + 216);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_8008;
  v15[3] = &unk_10950;
  v15[4] = v13;
  char v17 = *(unsigned char *)(a1 + 64);
  id v16 = *(id *)(a1 + 56);
  [v14 nextViewControllerWithCompletion:v15];
}

void sub_8008(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = [objc_alloc((Class)PKNavigationController) initWithRootViewController:v9];
LABEL_5:
    id v7 = v6;
    [*(id *)(a1 + 32) presentViewController:v6 animated:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];

    goto LABEL_6;
  }
  if (v5)
  {
    PKAlertForDisplayableError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
LABEL_6:
}

void sub_80C8(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    id v7[2] = sub_819C;
    v7[3] = &unk_107C0;
    id v6 = *(id *)(a1 + 48);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    [v4 _presentManateeUpgradeForFeatureApplication:v5 completion:v7];
  }
}

void sub_819C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v11 = v5;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v11 = v5;
    id v6 = PKTitleForDisplayableError();
    id v7 = PKMessageForDisplayableError();
    id v8 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];
    PKApplyDefaultIconToAlertController();
    id v9 = PKLocalizedPaymentString(@"HSA_OK_BUTTON_TITLE");
    uint64_t v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:0];
    [v8 addAction:v10];

    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
  }
  id v5 = v11;
LABEL_6:
}

void sub_83C4(uint64_t a1, char a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8458;
  v3[3] = &unk_10A18;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

uint64_t sub_8458(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_85EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_86C0;
  block[3] = &unk_10A68;
  uint64_t v14 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_86C0(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = PKSecurityCapabilitiesErrorToString();
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Finished checking account user invitation security capabilities with upgrade error %@, error %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 64);
  if (v5 == 3)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_10:
    v8();
    return;
  }
  if (v5)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "User successfully completed. Ensuring that they indeed supportsDeviceToDeviceEncryption", buf, 2u);
  }

  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_8880;
  v9[3] = &unk_105B8;
  id v10 = *(id *)(a1 + 56);
  [v6 _checkManateeCapabilityForFeatureApplication:v7 completion:v9];
}

void sub_8880(uint64_t a1, char a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8914;
  v3[3] = &unk_10A18;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

uint64_t sub_8914(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

Class sub_89F8()
{
  if (qword_15BC8 != -1) {
    dispatch_once(&qword_15BC8, &stru_10AD0);
  }
  Class result = objc_getClass("FKBankConnectAuthorizationSessionProvider");
  qword_15BB8 = (uint64_t)result;
  off_15A80 = (uint64_t (*)())sub_8A5C;
  return result;
}

id sub_8A5C()
{
  return (id)qword_15BB8;
}

void sub_8A68(id a1)
{
  qword_15BC0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FinanceKit.framework/FinanceKit", 2);
}

Class sub_8A94()
{
  if (qword_15BE0 != -1) {
    dispatch_once(&qword_15BE0, &stru_10AF0);
  }
  Class result = objc_getClass("FKBankConnectAuthorizationViewControllerProvider");
  qword_15BD0 = (uint64_t)result;
  off_15A88 = (uint64_t (*)())sub_8AF8;
  return result;
}

id sub_8AF8()
{
  return (id)qword_15BD0;
}

void sub_8B04(id a1)
{
  qword_15BD8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FinanceKitUI.framework/FinanceKitUI", 2);
}

void sub_8DA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8E6C;
  v8[3] = &unk_10658;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  id v12 = v6;
  id v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

void sub_8E6C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 120) institution];
  id v4 = [v3 institutionIdentifier];
  LODWORD(v2) = [v2 isEqualToString:v4];

  if (v2)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 144);
    if (v5)
    {
      [v5 setImage:*(void *)(a1 + 48)];
    }
    else
    {
      id v6 = [objc_alloc((Class)UIImageView) initWithImage:*(void *)(a1 + 48)];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 144);
      *(void *)(v7 + 144) = v6;

      [*(id *)(*(void *)(a1 + 40) + 144) setAccessibilityIgnoresInvertColors:1];
      [*(id *)(a1 + 56) addSubview:*(void *)(*(void *)(a1 + 40) + 144)];
    }
    [*(id *)(*(void *)(a1 + 40) + 144) setContentMode:1];
    [*(id *)(*(void *)(a1 + 40) + 136) removeFromSuperview];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void **)(v9 + 136);
    *(void *)(v9 + 136) = 0;

    id v11 = *(void **)(a1 + 40);
    [v11 setNeedsLayout];
  }
}

void sub_8FE8(id a1)
{
  qword_15BE8 = (uint64_t)objc_alloc_init(off_15BB0());

  _objc_release_x1();
}

Class sub_9750()
{
  if (qword_15C08 != -1) {
    dispatch_once(&qword_15C08, &stru_10B60);
  }
  Class result = objc_getClass("FKBankConnectImageProvider");
  qword_15BF8 = (uint64_t)result;
  off_15BB0 = (uint64_t (*)())sub_97B4;
  return result;
}

id sub_97B4()
{
  return (id)qword_15BF8;
}

void sub_97C0(id a1)
{
  qword_15C00 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FinanceKitUI.framework/FinanceKitUI", 2);
}

void sub_97EC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to handle BankConnect auth redirect. The auth session is nil!", v1, 2u);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

uint64_t PKAlertForDisplayableError()
{
  return _PKAlertForDisplayableError();
}

uint64_t PKApplyDefaultIconToAlertController()
{
  return _PKApplyDefaultIconToAlertController();
}

uint64_t PKFeatureIdentifierToString()
{
  return _PKFeatureIdentifierToString();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKMessageForDisplayableError()
{
  return _PKMessageForDisplayableError();
}

uint64_t PKPassKitBundle()
{
  return _PKPassKitBundle();
}

uint64_t PKSafariCredentialProvisioningConsented()
{
  return _PKSafariCredentialProvisioningConsented();
}

uint64_t PKSecurityCapabilitiesErrorToString()
{
  return _PKSecurityCapabilitiesErrorToString();
}

uint64_t PKSizeAlignedInRect()
{
  return _PKSizeAlignedInRect();
}

uint64_t PKTitleForDisplayableError()
{
  return _PKTitleForDisplayableError();
}

uint64_t PKUIScreenScale()
{
  return _PKUIScreenScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKLocalizedString(NSString *a1)
{
  return PKLocalizedString(a1);
}

uint64_t PKLocalizedFeatureString()
{
  return PKLocalizedFeatureString();
}

uint64_t PKLocalizedPaymentString(NSString *a1)
{
  return PKLocalizedPaymentString(a1);
}

uint64_t PKLocalizedBankConnectString(NSString *a1)
{
  return PKLocalizedBankConnectString(a1);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__loadCurrentScreen(void *a1, const char *a2, ...)
{
  return [a1 _loadCurrentScreen];
}

id objc_msgSend__restrictToShield(void *a1, const char *a2, ...)
{
  return [a1 _restrictToShield];
}

id objc_msgSend__shouldResetToRoot(void *a1, const char *a2, ...)
{
  return [a1 _shouldResetToRoot];
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 _shouldReverseLayoutDirection];
}

id objc_msgSend_aaAlternateDSID(void *a1, const char *a2, ...)
{
  return [a1 aaAlternateDSID];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_accountUserInvitation(void *a1, const char *a2, ...)
{
  return [a1 accountUserInvitation];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_associatedPassUniqueID(void *a1, const char *a2, ...)
{
  return [a1 associatedPassUniqueID];
}

id objc_msgSend_bankConnectImageProvider(void *a1, const char *a2, ...)
{
  return [a1 bankConnectImageProvider];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_consentStatus(void *a1, const char *a2, ...)
{
  return [a1 consentStatus];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultContactResolver(void *a1, const char *a2, ...)
{
  return [a1 defaultContactResolver];
}

id objc_msgSend_devicePrimaryPaymentApplication(void *a1, const char *a2, ...)
{
  return [a1 devicePrimaryPaymentApplication];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_feature(void *a1, const char *a2, ...)
{
  return [a1 feature];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fpanId(void *a1, const char *a2, ...)
{
  return [a1 fpanId];
}

id objc_msgSend_handlePendingURL(void *a1, const char *a2, ...)
{
  return [a1 handlePendingURL];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_institution(void *a1, const char *a2, ...)
{
  return [a1 institution];
}

id objc_msgSend_institutionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 institutionIdentifier];
}

id objc_msgSend_isCanceled(void *a1, const char *a2, ...)
{
  return [a1 isCanceled];
}

id objc_msgSend_isEffectivelyLocked(void *a1, const char *a2, ...)
{
  return [a1 isEffectivelyLocked];
}

id objc_msgSend_isInFailForward(void *a1, const char *a2, ...)
{
  return [a1 isInFailForward];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_passLibraryDataProvider(void *a1, const char *a2, ...)
{
  return [a1 passLibraryDataProvider];
}

id objc_msgSend_paymentDataProvider(void *a1, const char *a2, ...)
{
  return [a1 paymentDataProvider];
}

id objc_msgSend_peerPaymentDataSource(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentDataSource];
}

id objc_msgSend_peerPaymentService(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentService];
}

id objc_msgSend_peerPaymentWebService(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentWebService];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_presentActivatePhysicalCard(void *a1, const char *a2, ...)
{
  return [a1 presentActivatePhysicalCard];
}

id objc_msgSend_presentAutoReload(void *a1, const char *a2, ...)
{
  return [a1 presentAutoReload];
}

id objc_msgSend_presentBalanceDetails(void *a1, const char *a2, ...)
{
  return [a1 presentBalanceDetails];
}

id objc_msgSend_presentBankAccounts(void *a1, const char *a2, ...)
{
  return [a1 presentBankAccounts];
}

id objc_msgSend_presentBillPayment(void *a1, const char *a2, ...)
{
  return [a1 presentBillPayment];
}

id objc_msgSend_presentCardNumbers(void *a1, const char *a2, ...)
{
  return [a1 presentCardNumbers];
}

id objc_msgSend_presentISO18013Details(void *a1, const char *a2, ...)
{
  return [a1 presentISO18013Details];
}

id objc_msgSend_presentIdentityVerification(void *a1, const char *a2, ...)
{
  return [a1 presentIdentityVerification];
}

id objc_msgSend_presentMakeDefaultAtApple(void *a1, const char *a2, ...)
{
  return [a1 presentMakeDefaultAtApple];
}

id objc_msgSend_presentOrderPhysicalCard(void *a1, const char *a2, ...)
{
  return [a1 presentOrderPhysicalCard];
}

id objc_msgSend_presentReplacePhysicalCard(void *a1, const char *a2, ...)
{
  return [a1 presentReplacePhysicalCard];
}

id objc_msgSend_presentSchedulePayments(void *a1, const char *a2, ...)
{
  return [a1 presentSchedulePayments];
}

id objc_msgSend_presentShareAccount(void *a1, const char *a2, ...)
{
  return [a1 presentShareAccount];
}

id objc_msgSend_presentTermsAcceptance(void *a1, const char *a2, ...)
{
  return [a1 presentTermsAcceptance];
}

id objc_msgSend_presentTermsAndConditions(void *a1, const char *a2, ...)
{
  return [a1 presentTermsAndConditions];
}

id objc_msgSend_presentTopUp(void *a1, const char *a2, ...)
{
  return [a1 presentTopUp];
}

id objc_msgSend_presentTrackPhysicalCard(void *a1, const char *a2, ...)
{
  return [a1 presentTrackPhysicalCard];
}

id objc_msgSend_presentTransferToBank(void *a1, const char *a2, ...)
{
  return [a1 presentTransferToBank];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requestAccess(void *a1, const char *a2, ...)
{
  return [a1 requestAccess];
}

id objc_msgSend_secureElementPass(void *a1, const char *a2, ...)
{
  return [a1 secureElementPass];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_shouldPreventAutomaticDismissal(void *a1, const char *a2, ...)
{
  return [a1 shouldPreventAutomaticDismissal];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_subTitleFont(void *a1, const char *a2, ...)
{
  return [a1 subTitleFont];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemGroupedBackgroundColor];
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return [a1 titleFont];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_viewDidAppear(void *a1, const char *a2, ...)
{
  return [a1 viewDidAppear];
}

id objc_msgSend_willHandleURL(void *a1, const char *a2, ...)
{
  return [a1 willHandleURL];
}