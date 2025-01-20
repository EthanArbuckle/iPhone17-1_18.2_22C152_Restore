id sub_10000285C(UIView *self, SEL a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  unsigned char v15[128];
  uint64_t vars8;

  v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:self];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = [(UIView *)self subviews];
  v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    v6 = v5;
    v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) allSubViews];
        [v3 addObjectsFromArray:v9];
      }
      v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

id sub_100003238(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isPreparingForFolderSharing];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 setIsLoading:1];
  }
  else
  {
    v4 = (void *)v3[4];
    return [v4 setHidden:0];
  }
}

void sub_10000352C(id a1)
{
  qword_100061C70 = [[UIShareFeatureStateFFSetting alloc] initWithDomainID:@"CloudDocsUI" featureID:@"CoOwners" valueMode:1 buildType:1];

  _objc_release_x1();
}

void sub_10000380C(uint64_t a1, uint64_t a2)
{
  v3 = +[NSString stringWithFormat:@"feature flag (%@): %@.%@", a2, *(void *)(a1 + 32), *(void *)(a1 + 40)];
  unsigned int v4 = [*(id *)(a1 + 48) isEnabled];
  id v5 = v3;
  v6 = @"NO";
  if (v4) {
    v6 = @"YES";
  }
  v7 = v6;
  v8 = cdui_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Feature Flag] Initializing %@ to value = %@", buf, 0x16u);
  }
}

void sub_1000040DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004100(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004190;
  block[3] = &unk_10004C9A8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100004190(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    v3 = [WeakRetained progress];
    unsigned int v4 = v3;
    if (v3)
    {
      id v5 = [v3 userInfo];
      v6 = [v5 objectForKey:NSProgressFileOperationKindKey];
      unsigned int v7 = [v6 isEqualToString:NSProgressFileOperationKindUploading];
      if (v7)
      {
        v1 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        [v1 localizedStringForKey:@"PROGRESS_UPLOADING_TEXT" value:@"Uploading" table:@"Localizable"];
      }
      else
      {
        [v4 localizedDescription];
      v8 = };
      v9 = [v12 titleLabel];
      [v9 setText:v8];

      if (v7)
      {

        v8 = v1;
      }

      id v10 = [v4 localizedAdditionalDescription];
      __int16 v11 = [v12 progressLabel];
      [v11 setText:v10];
    }
    id WeakRetained = v12;
  }
}

void sub_100005238(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) staticTableView];
  [v1 reloadData];
}

id sub_1000053A8(uint64_t a1)
{
  [*(id *)(a1 + 32) setModelSnapshot:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateSections];
}

id sub_10000573C(void *a1)
{
  id v1 = a1;
  id v2 = [v1 contact];
  if (v2)
  {
    v3 = [v1 contact];
    unsigned int v4 = +[CNContactFormatter stringFromContact:v3 style:0];
  }
  else
  {
    unsigned int v4 = 0;
  }

  id v5 = [v1 participant];
  if (![v4 length])
  {
    v6 = [v5 userIdentity];
    unsigned int v7 = [v6 nameComponents];
    uint64_t v8 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v7 style:1 options:0];

    unsigned int v4 = (void *)v8;
  }
  if (![v4 length])
  {
    v9 = [v5 userIdentity];
    id v10 = [v9 lookupInfo];
    uint64_t v11 = [v10 emailAddress];

    unsigned int v4 = (void *)v11;
  }
  if (![v4 length])
  {
    id v12 = [v5 userIdentity];
    v13 = [v12 lookupInfo];
    v14 = [v13 phoneNumber];
    uint64_t v15 = BRFormatPhoneNumber();

    unsigned int v4 = (void *)v15;
  }

  return v4;
}

void sub_1000058E8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 shareViewControllerStopSharing:*(void *)(a1 + 32) overrideAlert:1];
  }
}

void sub_100005948(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) share];
  uint64_t v2 = [*(id *)(a1 + 40) participant];
  [v3 removeParticipant:v2];
}

void sub_1000059B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setNavigationItemSpinner:0];
  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) presentError:v5];
    id v4 = v5;
  }
}

void sub_100005C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005C70(uint64_t a1, void *a2)
{
  [a2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPreferredContentSize:", v4, v6);
}

void sub_100005F60(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) staticTableView];
  uint64_t v2 = [*(id *)(a1 + 32) staticTableView];
  double v3 = [v2 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v3 animated:1];
}

void sub_1000061C4(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v5 = a3;
  if (v25)
  {
    double v6 = +[UIPasteboard generalPasteboard];
    [v6 setValue:v25 forPasteboardType:kUTTypeURL];

    LODWORD(v6) = UIAccessibilityAnnouncementNotification;
    unsigned int v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v8 = [v7 localizedStringForKey:@"COPY_LINK_ACTION_ACCESSIBILITY_ANNOUNCEMENT" value:@"shared link copied to clipboard" table:@"Localizable"];
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v8);
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    if (v5)
    {
      [v9 presentError:v5];
    }
    else
    {
      id v10 = [v9 delegate];
      uint64_t v11 = [v10 shareViewControllerItemUTI:*(void *)(a1 + 32)];

      id v12 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v13 = [v12 localizedStringForKey:@"COULD_NOT_COPY_LINK_MESSAGE_TEXT", @"Sorry, the item link couldn’t be copied.", @"Localizable" value table];
      v14 = _CDAdaptLocalizedStringForItemType();
      uint64_t v15 = +[NSString localizedStringWithFormat:v14];

      v16 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v17 = [v16 localizedStringForKey:@"COULD_NOT_COPY_LINK_TITLE_TEXT" value:@"Couldn’t Copy Link" table:@"Localizable"];
      v18 = +[UIAlertController alertControllerWithTitle:v17 message:v15 preferredStyle:1];

      v19 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v20 = [v19 localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
      v21 = +[UIAlertAction actionWithTitle:v20 style:0 handler:0];
      [v18 addAction:v21];

      [*(id *)(a1 + 32) presentViewController:v18 animated:1 completion:0];
    }
  }
  v22 = [*(id *)(a1 + 32) staticTableView];
  v23 = [*(id *)(a1 + 32) staticTableView];
  v24 = [v23 indexPathForSelectedRow];
  [v22 deselectRowAtIndexPath:v24 animated:1];

  [*(id *)(a1 + 32) setNavigationItemSpinner:0];
}

id sub_1000089E0(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalPresentationStyle:6];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);

  return [v2 presentViewController:v3 animated:v4 completion:0];
}

uint64_t sub_100008E18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100008E2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000095F0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) settings];
  [*(id *)(a1 + 32) setSettings:v2];

  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v3, "shareViewController:modifyShare:completion:", _NSConcreteStackBlock, 3221225472, sub_100009750, &unk_10004CA78, *(void *)(a1 + 32), _NSConcreteStackBlock, 3221225472, sub_1000096E4, &unk_10004CB40, *(void *)(a1 + 32));
}

void sub_1000096E4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) settings];
  uint64_t v2 = [*(id *)(a1 + 32) share];
  [v3 applyToShare:v2];
}

id *sub_100009750(id *result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (id *)objc_msgSend(result[4], "presentError:");
  }
  return result;
}

void sub_100009760(uint64_t a1)
{
  uint64_t v2 = cdui_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[INFO] permission not granted, resetting to previous settings", v4, 2u);
  }

  id v3 = [*(id *)(a1 + 40) settings];
  [*(id *)(a1 + 32) setSettings:v3];
}

uint64_t sub_1000097EC(uint64_t a1)
{
  uint64_t v2 = cdui_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[INFO] permission granted", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009A70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  double v6 = *(void **)(a1 + 32);
  id v7 = a2;
  [v6 setNavigationItemSpinner:0];
  uint64_t v8 = [v7 participants];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009BC4;
  v13[3] = &unk_10004CBD0;
  id v14 = *(id *)(a1 + 40);
  id v9 = [v8 indexOfObjectPassingTest:v13];

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = cdui_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10002DC58((id *)(a1 + 40), v10);
    }

    uint64_t v11 = [*(id *)(a1 + 32) navigationController];
    id v12 = [v11 popToViewController:*(void *)(a1 + 32) animated:1];
  }
  if (v5) {
    [*(id *)(a1 + 32) presentError:v5];
  }
}

id sub_100009BC4(uint64_t a1, void *a2)
{
  id v3 = [a2 participantID];
  uint64_t v4 = [*(id *)(a1 + 32) contact];
  id v5 = [v4 participant];
  double v6 = [v5 participantID];
  id v7 = [v3 isEqualToString:v6];

  return v7;
}

void sub_10000C244(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) staticTableView];
  [v2 beginUpdates];

  id v3 = [*(id *)(a1 + 32) staticTableView];
  uint64_t v4 = +[NSIndexSet indexSetWithIndex:*(void *)(*(void *)(a1 + 32) + 24)];
  [v3 reloadSections:v4 withRowAnimation:5];

  [*(id *)(a1 + 32) updateSections];
  id v5 = [*(id *)(a1 + 32) staticTableView];
  [v5 endUpdates];
}

id sub_10000C6C8(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSections];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _sendSettingsControllerDidChange];
}

void sub_10000C704(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) staticTableView];
  [v2 beginUpdates];

  id v3 = [*(id *)(a1 + 32) staticTableView];
  uint64_t v4 = +[NSIndexSet indexSetWithIndex:*(void *)(*(void *)(a1 + 32) + 8)];
  [v3 reloadSections:v4 withRowAnimation:5];

  [*(id *)(a1 + 32) updateSections];
  int v5 = *(unsigned __int8 *)(a1 + 41);
  if (*(unsigned __int8 *)(a1 + 40) != v5 && !*(unsigned char *)(a1 + 42))
  {
    double v6 = [*(id *)(a1 + 32) staticTableView];
    id v7 = +[NSIndexSet indexSetWithIndex:*(void *)(*(void *)(a1 + 32) + 8) + 1];
    if (v5) {
      [v6 insertSections:v7 withRowAnimation:5];
    }
    else {
      [v6 deleteSections:v7 withRowAnimation:5];
    }
  }
  id v8 = [*(id *)(a1 + 32) staticTableView];
  [v8 endUpdates];
}

id sub_10000C9CC(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSections];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _sendSettingsControllerDidChange];
}

void sub_10000CB2C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    uint64_t v4 = +[UIPasteboard generalPasteboard];
    [v4 setValue:v3 forPasteboardType:kUTTypeURL];
  }
  id v7 = [*(id *)(a1 + 32) staticTableView];
  int v5 = [*(id *)(a1 + 32) staticTableView];
  double v6 = [v5 indexPathForSelectedRow];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

void sub_10000CCA0(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) staticTableView];
  uint64_t v2 = [*(id *)(a1 + 32) staticTableView];
  id v3 = [v2 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v3 animated:1];
}

BOOL sub_10000D2EC(id a1, CKShareParticipant *a2, NSDictionary *a3)
{
  return (id)[(CKShareParticipant *)a2 type] != (id)1;
}

void sub_10000EE90(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) addressView];
  [v1 becomeFirstResponder];
}

void sub_10000F188(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) addressView];
  [v1 becomeFirstResponder];
}

void sub_10000F4EC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) addressView];
  [v1 becomeFirstResponder];
}

void sub_10000F584(id a1)
{
  uint64_t v1 = +[CNContactStore storeWithOptions:9];
  uint64_t v2 = (void *)qword_100061C80;
  qword_100061C80 = v1;

  id v3 = (void *)qword_100061C80;

  [v3 requestAccessForEntityType:0 completionHandler:&stru_10004CCC0];
}

id sub_10000F660(void *a1, void *a2, void *a3, int a4, int a5)
{
  id v9 = a1;
  unint64_t v10 = a2;
  unint64_t v11 = a3;
  id v12 = +[CNMonogrammer descriptorForRequiredKeysIncludingImage:1];
  v28[0] = v12;
  v13 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v28[1] = v13;
  v28[2] = CNContactEmailAddressesKey;
  v28[3] = CNContactPhoneNumbersKey;
  id v14 = +[CNContactViewController descriptorForRequiredKeys];
  v28[4] = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:v28 count:5];

  v16 = 0;
  id v17 = 0;
  if (v10 && a4)
  {
    v18 = +[CNContact predicateForContactsMatchingEmailAddress:v10];
    id v27 = 0;
    v19 = [v9 unifiedContactsMatchingPredicate:v18 keysToFetch:v15 error:&v27];
    id v17 = v27;
    v16 = [v19 firstObject];
  }
  if (v16 || !a5)
  {
LABEL_11:
    if (v16) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v10 | v11)
  {
    if (v11)
    {
      id v20 = (id)v11;
    }
    else
    {
      id v20 = +[CNPhoneNumber phoneNumberWithStringValue:v10];
    }
    v21 = v20;
    v22 = +[CNContact predicateForContactsMatchingPhoneNumber:v20];
    id v26 = v17;
    v23 = [v9 unifiedContactsMatchingPredicate:v22 keysToFetch:v15 error:&v26];
    id v24 = v26;

    v16 = [v23 firstObject];

    id v17 = v24;
    goto LABEL_11;
  }
LABEL_12:
  v16 = +[CNContact contactWithDisplayName:0 emailOrPhoneNumber:v10];
LABEL_13:

  return v16;
}

id sub_10000FB1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSearchResults:*(void *)(a1 + 40) changes:*(void *)(a1 + 48)];
}

void sub_10000FBEC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 72) count];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 searchResultTable];
    double v5 = 1.0;
  }
  else
  {
    double v6 = [v3 addressView];
    id v7 = [v6 text];
    id v8 = [v7 length];

    if (v8) {
      return;
    }
    id v4 = [*(id *)(a1 + 32) searchResultTable];
    double v5 = 0.0;
  }
  id v9 = v4;
  [v4 setAlpha:v5];
}

void sub_100010D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010D98(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  double v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained presentingViewController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100010E9C;
  v10[3] = &unk_10004CD10;
  objc_copyWeak(&v12, v6);
  char v13 = a2;
  id v9 = v5;
  id v11 = v9;
  [v8 dismissViewControllerAnimated:1 completion:v10];

  objc_destroyWeak(&v12);
}

void sub_100010E88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100010E9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained completion];

  if (v2)
  {
    id v3 = [WeakRetained completion];
    v3[2](v3, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
}

void sub_1000110A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

BOOL sub_100012028(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) valueForKey:*(void *)(a1 + 40)];
  if ([v4 isEqual:v3])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v4 integerValue];
      BOOL v5 = v6 == [v3 integerValue];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

void sub_1000130D8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:@"remact"];
  SEL v3 = NSSelectorFromString(v2);

  id v4 = [*(id *)(a1 + 32) objectForKey:@"param"];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) cellForRowAtIndexPath:*(void *)(a1 + 48)];
  }
  id v7 = v6;

  [*(id *)(a1 + 56) performSelector:v3 withObject:v7];
}

id sub_1000141A4(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UIShareHeaderFooterView;
  return objc_msgSendSuper2(&v2, "layoutSubviews");
}

uint64_t sub_100014F44(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 existingRecipients];
  BOOL v5 = [v3 address];

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  return v6;
}

void sub_1000151E0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v3;

  uint64_t v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 40) count]);
  id v7 = +[CNMonogrammer descriptorForRequiredKeysIncludingImage:1];
  v17[0] = v7;
  id v8 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v17[1] = v8;
  v17[2] = CNContactEmailAddressesKey;
  uint64_t v9 = +[NSArray arrayWithObjects:v17 count:3];

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 48);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000153A0;
  v14[3] = &unk_10004CEF0;
  v14[4] = v10;
  id v15 = v9;
  id v16 = v6;
  id v12 = v6;
  id v13 = v9;
  [v11 enumerateObjectsUsingBlock:v14];
  [*(id *)(a1 + 32) processUpdate:v12 changedObjects:0];
}

void sub_1000153A0(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (([v8 isGroup] & 1) == 0)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v4 = [v8 contact];
    BOOL v5 = [v4 identifier];
    uint64_t v6 = [v3 unifiedContactWithIdentifier:v5 keysToFetch:*(void *)(a1 + 40) error:0];

    if (v6) {
      [v8 setContact:v6];
    }
    id v7 = objc_opt_new();
    [v7 setComposeRecipient:v8];
    [*(id *)(a1 + 48) addObject:v7];
  }
}

void sub_1000165BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000165EC(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1[4];
  objc_sync_enter(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000166E8;
  v6[3] = &unk_10004CF30;
  v6[4] = a1[4];
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v9, a1 + 6);
  id v8 = a1[5];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v9);
  objc_sync_exit(v4);
}

void sub_1000166E8(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) folderSharingPreparationError];
  if (v2)
  {
  }
  else if (*(void *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained cancel];

    [*(id *)(a1 + 32) setFolderSharingPreparationError:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) setHasPreparedForFolderSharing:1];
  id v4 = [*(id *)(a1 + 32) viewController];
  [v4 folderSharingPreparationDidComplete];

  id v5 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v5);
}

void sub_1000168C0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000169BC;
  block[3] = &unk_10004CF80;
  id v15 = a4;
  id v16 = v8;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  id v17 = v7;
  uint64_t v18 = v9;
  id v19 = v10;
  id v11 = v7;
  id v12 = v8;
  id v13 = v15;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000169BC(uint64_t a1)
{
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    objc_super v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    id v3 = cdui_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[INFO] document is sub-item of folder share", v5, 2u);
    }

    id v4 = [[BRCKShareSubitem alloc] initWithShare:*(void *)(a1 + 48)];
    objc_storeStrong((id *)(*(void *)(a1 + 56) + 112), *(id *)(a1 + 48));
    objc_storeStrong((id *)(*(void *)(a1 + 56) + 16), *(id *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_100016BF0(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v7)
  {
    [*(id *)(a1 + 32) _enqueueCopyShareURLOperation:v7 completion:0];
    uint64_t v10 = [*(id *)(a1 + 32) shareCreationSema];
    dispatch_semaphore_signal(v10);
  }
  else if ([v8 code] == (id)14 || objc_msgSend(v9, "code") == (id)7)
  {
    id v11 = [*(id *)(a1 + 32) workerQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100016D7C;
    v16[3] = &unk_10004C918;
    v16[4] = *(void *)(a1 + 32);
    [v11 addOperationWithBlock:v16];
    goto LABEL_7;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016FCC;
  block[3] = &unk_10004CFD0;
  void block[4] = *(void *)(a1 + 32);
  id v13 = v7;
  id v14 = v9;
  char v15 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  id v11 = v13;
LABEL_7:
}

void sub_100016D7C(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) itemURL];
  id v8 = 0;
  [v2 getPromisedItemResourceValue:&v8 forKey:NSURLUbiquitousItemIsUploadedKey error:0];
  id v3 = v8;

  if ([v3 BOOLValue])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016F30;
    block[3] = &unk_10004C918;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 500000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100016F38;
    v6[3] = &unk_10004C918;
    v6[4] = *(void *)(a1 + 32);
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100016F40;
    v5[3] = &unk_10004C918;
    v5[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

id sub_100016F30(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCloudDocsShare];
}

id sub_100016F38(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCloudDocsShare];
}

id sub_100016F40(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isShowingSpinner];
  if (result)
  {
    id v3 = cdui_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)dispatch_time_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[INFO] Couldn't get share because the item is not in the cloud yet: creating overview controller anyway", v4, 2u);
    }

    [*(id *)(a1 + 32) setInitialSharing:1];
    return [*(id *)(a1 + 32) _loadInitialViewController];
  }
  return result;
}

id sub_100016FCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupWithShare:*(void *)(a1 + 40) error:*(void *)(a1 + 48) initialShare:*(unsigned __int8 *)(a1 + 56)];
}

void sub_100016FE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    id v16 = [v6 domain];
    if ([v16 isEqualToString:BRCloudDocsErrorDomain])
    {
      id v17 = [v7 code];

      if (v17 == (id)20)
      {
        uint64_t v18 = cdui_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[INFO] document isn't shared, doing existing subshare preflight check", buf, 2u);
        }

        dispatch_time_t v19 = dispatch_time(0, 1500000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000173C8;
        block[3] = &unk_10004C918;
        void block[4] = *(void *)(a1 + 32);
        dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100017420;
        v24[3] = &unk_10004D020;
        id v20 = *(void **)(a1 + 32);
        id v25 = *(id *)(a1 + 40);
        [v20 preflightAndPrepareIfFolderShare:0 completion:v24];
        char v15 = v25;
        goto LABEL_17;
      }
    }
    else
    {
    }
    id v12 = cdui_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] copy share failed", buf, 2u);
    }
    goto LABEL_27;
  }
  id v8 = cdui_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] copy BR share finished", buf, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v9 + 36) || !*(void *)(v9 + 16))
  {
    if ([v5 publicPermission] == (id)1)
    {
      uint64_t v10 = [v5 participants];
      id v11 = [v10 count];

      id v12 = cdui_default_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if ((unint64_t)v11 <= 1)
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] got a preexisting disabled share--treat as initial share", buf, 2u);
        }

        [v5 setPublicPermission:3];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10001743C;
        v22[3] = &unk_10004D020;
        id v14 = *(void **)(a1 + 32);
        id v23 = *(id *)(a1 + 40);
        [v14 preflightAndPrepareIfFolderShare:v5 completion:v22];
        char v15 = v23;
LABEL_17:

        goto LABEL_28;
      }
      if (v13)
      {
        *(_WORD *)buf = 0;
        v21 = "[INFO] got a preexisting share with participants";
        goto LABEL_26;
      }
    }
    else
    {
      id v12 = cdui_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v21 = "[INFO] got a preexisting public share";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v21, buf, 2u);
      }
    }
LABEL_27:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_28;
  }
  [(id)v9 changeToTopLevelSharedFolderURL];
LABEL_28:
}

id sub_1000173C8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isShowingSpinner];
  if (result)
  {
    [*(id *)(a1 + 32) setInitialSharing:1];
    id v3 = *(void **)(a1 + 32);
    return [v3 _loadInitialViewController];
  }
  return result;
}

uint64_t sub_100017420(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001743C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100017540(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017604;
  v7[3] = &unk_10004D070;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

void sub_100017604(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = cdui_default_log();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_10002DED0();
    }

    id v5 = [*(id *)(a1 + 40) viewController];
    [v5 presentError:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) shareViewControllerDismiss:0];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] existing subshare preflight check finished", buf, 2u);
    }

    [*(id *)(a1 + 40) _prepareForFolderSharingIfNeeded];
    if (*(void *)(a1 + 48))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v6 = [*(id *)(a1 + 40) itemURL];
      id v7 = BRSharingCreateShareForItemAtURL();
      id v8 = 0;

      [v7 setPublicPermission:3];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void sub_1000178A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000178BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000178CC(uint64_t a1)
{
}

void sub_1000178D4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100017A64(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017B14;
  block[3] = &unk_10004D138;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100017B14(id *a1)
{
  id v2 = a1[4];
  if (v2)
  {
    id v3 = [v2 domain];
    if ([v3 isEqualToString:BRCloudDocsErrorDomain])
    {
      id v4 = [a1[4] code];

      if (v4 == (id)38)
      {
        id v5 = [a1[4] userInfo];
        id v6 = [v5 objectForKeyedSubscript:BRFailedURLsKey];

        v28 = v6;
        if (![v6 count])
        {
          id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          id v12 = [v7 localizedStringForKey:@"ALERT_EXISTING_SHARED_ITEMS_MESSAGE_UNKNOWN_ITEMS" value:@"This folder already contains shared items. People who currently have access to these items may lose it." table:@"Localizable"];
LABEL_19:

          id v17 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          uint64_t v18 = [v17 localizedStringForKey:@"ALERT_EXISTING_SHARED_ITEMS_TITLE" value:@"Sharing this folder will change who can read and edit all items within it." table:@"Localizable"];
          dispatch_time_t v19 = +[UIAlertController alertControllerWithTitle:v18 message:v12 preferredStyle:1];

          id v20 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v21 = [v20 localizedStringForKey:@"ALERT_SHARE_BUTTON_TITLE" value:@"Share" table:@"Localizable"];
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100018050;
          v31[3] = &unk_10004D110;
          id v22 = a1[6];
          v31[4] = a1[5];
          id v32 = v22;
          id v23 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v31];

          id v24 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          id v25 = [v24 localizedStringForKey:@"ALERT_CANCEL_BUTTON_TITLE" value:@"Cancel" table:@"Localizable"];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1000180EC;
          v29[3] = &unk_10004CB18;
          id v30 = a1[6];
          id v26 = +[UIAlertAction actionWithTitle:v25 style:1 handler:v29];

          [v19 addAction:v23];
          [v19 addAction:v26];
          [a1[5] presentViewController:v19 animated:1 completion:0];

          return;
        }
        if ([v6 count] == (id)1)
        {
          id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          id v8 = [v7 localizedStringForKey:@"ALERT_EXISTING_SHARED_ITEMS_MESSAGE_ONE_ITEM" value:@"This folder already contains a shared item “%@”. People who currently have access to this item may lose it." table:@"Localizable"];
          uint64_t v9 = [v6 firstObject];
          id v10 = [v9 lastPathComponent];
          +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10, v27, v6);
        }
        else
        {
          id v13 = [v6 count];
          id v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          id v7 = v14;
          if (v13 == (id)2)
          {
            id v8 = [v14 localizedStringForKey:@"ALERT_EXISTING_SHARED_ITEMS_MESSAGE_TWO_ITEMS" value:@"This folder already contains shared items “%@” and “%@”. People who currently have access to these items may lose it." table:@"Localizable"];
            uint64_t v9 = [v6 objectAtIndexedSubscript:0];
            id v10 = [v9 lastPathComponent];
            char v15 = [v6 objectAtIndexedSubscript:1];
            id v16 = [v15 lastPathComponent];
            id v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10, v16, v6);

LABEL_18:
            goto LABEL_19;
          }
          id v8 = [v14 localizedStringForKey:@"ALERT_EXISTING_SHARED_ITEMS_MESSAGE", @"This folder already contains shared items, including “%@” and %lu others. People who currently have access to these items may lose it.", @"Localizable" value table];
          uint64_t v9 = [v6 firstObject];
          id v10 = [v9 lastPathComponent];
          +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10, (char *)[v6 count] - 1, v6);
        id v12 = };
        goto LABEL_18;
      }
    }
    else
    {
    }
    id v11 = (void (*)(void))*((void *)a1[6] + 2);
  }
  else
  {
    id v11 = (void (*)(void))*((void *)a1[6] + 2);
  }

  v11();
}

void sub_100018050(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000180DC;
  v2[3] = &unk_10004D0E8;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _processSubitemsWithProcessType:2 completion:v2];
}

uint64_t sub_1000180DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000180EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:&__NSDictionary0__struct];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t sub_100018270(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100018800(uint64_t a1)
{
  return [*(id *)(a1 + 32) shareViewControllerDismiss:0];
}

void sub_10001880C(uint64_t a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openURL:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) shareViewControllerDismiss:0];
}

void sub_100018CA0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 appName];
  id v4 = [v2 _alertControllerForLegacyApplication:v3];

  [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
}

void sub_100018EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018F08(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v7)
    {
      id v4 = [WeakRetained itemURL];
      if (v4 == v7)
      {
      }
      else
      {
        id v5 = [WeakRetained itemURL];
        unsigned __int8 v6 = [v7 isEqual:v5];

        if ((v6 & 1) == 0)
        {
          [WeakRetained setItemURL:v7];
          [WeakRetained _presentedURLChanged];
        }
      }
    }
    else
    {
      [WeakRetained _presentedURLDeleted];
    }
  }
}

void sub_100019138(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v9 = cdui_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10002DF38();
    }
  }
  else
  {
    id v8 = [v5 UIImage];
    uint64_t v9 = v8;
    if (v8)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100019254;
      v10[3] = &unk_10004CA00;
      void v10[4] = *(void *)(a1 + 40);
      uint64_t v9 = v8;
      id v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }

  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
}

void sub_100019254(uint64_t a1)
{
  [*(id *)(a1 + 32) setThumbnail:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 updateThumbnail];
}

void sub_100019820(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000198F0;
  v10[3] = &unk_10004CFD0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  char v14 = *(unsigned char *)(a1 + 40);
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

void sub_1000198F0(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_sanitizeForAvailablePermissions:");
    [*(id *)(a1 + 40) _setupWithShare:*(void *)(a1 + 32) error:0 initialShare:*(unsigned __int8 *)(a1 + 56)];
    id v9 = [*(id *)(a1 + 40) itemName];
    id v2 = [*(id *)(a1 + 40) viewController];
    [v2 setItemName:v9];

    return;
  }
  id v3 = (id *)(a1 + 48);
  id v4 = [*(id *)(a1 + 48) domain];
  if ([v4 isEqualToString:CKErrorDomain]
    && ([*v3 code] == (id)4 || objc_msgSend(*v3, "code") == (id)3))
  {
    id v5 = [*(id *)(a1 + 40) reachabilityMonitor];
    unsigned __int8 v6 = [v5 isNetworkReachable];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = cdui_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] Decrypting share failed with network error, retrying after reachability change", buf, 2u);
      }

      *(unsigned char *)(*(void *)(a1 + 40) + 8) = 1;
      return;
    }
  }
  else
  {
  }
  id v8 = cdui_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    sub_10002DFA4();
  }

  [*(id *)(a1 + 40) shareViewController:0 presentError:*(void *)(a1 + 48)];
}

id sub_10001A554(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _updateReachabilityStatus:1];
  if (*(unsigned char *)(a1 + 40))
  {
    id result = *(id *)(a1 + 32);
    if (*((unsigned char *)result + 8))
    {
      if (*((void *)result + 19) == 1)
      {
        return [result _updateCloudKitShare];
      }
    }
  }
  return result;
}

id sub_10001A7D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCloudDocsShare];
}

void sub_10001AEAC(uint64_t a1)
{
  id v2 = cdui_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[INFO] Dismissal for fullscreen complete, requesting representation", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) containedNavController];
  [v3 dismissViewControllerAnimated:0 completion:0];

  id v4 = +[UIColor clearColor];
  id v5 = [*(id *)(a1 + 32) parentViewController];
  unsigned __int8 v6 = [v5 view];
  uint64_t v7 = [v6 window];
  [v7 setBackgroundColor:v4];

  id v8 = [*(id *)(a1 + 32) containedNavController];
  id v9 = [v8 view];
  [v9 removeFromSuperview];

  id v10 = [*(id *)(a1 + 32) containedNavController];
  [v10 removeFromParentViewController];

  id v11 = [*(id *)(a1 + 32) hostingViewController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001B058;
  v13[3] = &unk_10004D228;
  uint64_t v12 = *(void **)(a1 + 40);
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v12;
  [v11 _representFullscreenAfterActivityDismissal:v13];
}

uint64_t sub_10001B058(uint64_t a1)
{
  id v2 = cdui_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[INFO] Representation complete", v5, 2u);
  }

  id v3 = [*(id *)(a1 + 32) fullscreenRepresentationGroup];
  dispatch_group_leave(v3);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001B0EC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fullscreenRepresentationGroup];
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  id v3 = *(void **)(a1 + 40);

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

uint64_t sub_10001B1D8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10001B544(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3)
  {
    unsigned __int8 v6 = [*(id *)(a1 + 32) sharingAppName];
    uint64_t v7 = [*(id *)(a1 + 32) itemName];
    id v8 = objc_alloc_init((Class)LPiCloudSharingMetadata);
    id v9 = [*(id *)(a1 + 32) sharingAppBundleIdentifier];
    [v8 setApplicationBundleIdenfier:v9];

    [v8 setApplication:v6];
    [v8 setTitle:v7];
    if ([*(id *)(a1 + 32) isFolderShare])
    {
      uint64_t v10 = +[UIImage imageNamed:@"Folder140pt"];
      id v11 = objc_alloc_init((Class)LPImageProperties);
      [v11 setType:5];
      v46 = (void *)v10;
      id v12 = [objc_alloc((Class)LPImage) initWithPlatformImage:v10 properties:v11];
    }
    else
    {
      [v8 applicationBundleIdenfier];
      id v14 = v13 = v7;
      id v11 = +[LSApplicationProxy applicationProxyForIdentifier:v14];

      uint64_t v7 = v13;
      v46 = +[UIImage _iconForResourceProxy:v11 format:1];
      id v12 = [objc_alloc((Class)LPImage) initWithPlatformImage:v46];
    }
    char v15 = v12;
    [v8 setIcon:v12];

    id v16 = objc_alloc_init((Class)LPLinkMetadata);
    [v16 setURL:v5];
    [v16 setSpecialization:v8];
    id v17 = [*(id *)(a1 + 40) activityType];
    if ([v17 isEqualToString:UIActivityTypeMail])
    {
      uint64_t v18 = [*(id *)(a1 + 32) _mailTemplate];
      id v19 = [v18 length];

      if (v19)
      {
        id v43 = [objc_alloc((Class)LPLinkHTMLTextGenerator) initWithURL:v5];
        [v43 setMetadata:v16];
        id v20 = [v43 HTMLFragmentString];
        v47[0] = @"SHARE_URL";
        v21 = [v5 absoluteString];
        id v22 = [v21 stringByRemovingPercentEncoding];
        v48[0] = v22;
        v47[1] = @"ITEM_NAME";
        id v23 = [v8 title];
        v48[1] = v23;
        v47[2] = @"APP_NAME";
        [v8 application];
        id v24 = v44 = v7;
        v47[3] = @"LINK_FRAGMENT";
        v48[2] = v24;
        v48[3] = v20;
        +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];
        id v25 = v45 = v6;

        id v26 = *(void **)(a1 + 32);
        id v27 = *(id *)(a1 + 40);
        v28 = [v26 _mailSubject];
        v29 = objc_msgSend(v28, "_ui_stringWithTemplateDictionary:", v25);
        [v27 setSubject:v29];

        id v30 = [v27 mailComposeViewController];
        v31 = [*(id *)(a1 + 32) _mailTemplate];
        id v32 = objc_msgSend(v31, "_ui_stringWithTemplateDictionary:", v25);
        [v30 setMessageBody:v32 isHTML:1];

        uint64_t v7 = v44;
        v33 = [v27 mailComposeViewController];

        [v33 setKeyboardVisible:1];
        unsigned __int8 v6 = v45;

LABEL_15:
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_16;
      }
    }
    else
    {
    }
    v34 = [*(id *)(a1 + 40) activityType];
    unsigned int v35 = [v34 isEqualToString:UIActivityTypeMessage];

    if (v35)
    {
      id v36 = *(id *)(a1 + 40);
      v37 = [v16 dataRepresentation];
      v38 = [*(id *)(a1 + 32) _messageTemplate];
      id v39 = [v38 length];

      v40 = [v36 messageComposeViewController];
      v41 = v40;
      if (v39)
      {
        v42 = [*(id *)(a1 + 32) _messageTemplate];
        [v41 setBody:v42];
      }
      else
      {
        [v40 addRichLinkData:v37 withWebpageURL:v5];

        v41 = [v36 messageComposeViewController];
        [v41 setBody:0];
      }
    }
    goto LABEL_15;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
}

id sub_10001C83C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissForRecordWithError:*(void *)(a1 + 40)];
}

id sub_10001C848(uint64_t a1)
{
  return [*(id *)(a1 + 32) shareViewControllerDismiss:*(void *)(a1 + 40)];
}

id sub_10001C854(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_10001CFAC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5 && !a3)
  {
    if ([*(id *)(a1 + 32) currentUserIsOwner])
    {
      unsigned __int8 v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      uint64_t v7 = [v6 localizedStringForKey:@"SHARED_BY_ME_TEXT" value:@"Shared by Me" table:@"Localizable"];
    }
    else
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = [v5 ownerNameComponents];
      unsigned __int8 v6 = [v8 ownerStringForPerson:v9];

      uint64_t v10 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      if (v6)
      {
        id v11 = [v10 localizedStringForKey:@"SHARED_BY_OTHER_TEXT" value:@"Shared by %@" table:@"Localizable"];
        uint64_t v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v6);
      }
      else
      {
        uint64_t v7 = [v10 localizedStringForKey:@"SHARED_BY_UNKNOWN_OTHER_TEXT" value:@"Shared" table:@"Localizable"];
      }
    }
    if (v7)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001D1A0;
      block[3] = &unk_10004CA00;
      void block[4] = *(void *)(a1 + 32);
      id v13 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

void sub_10001D1A0(uint64_t a1)
{
  [*(id *)(a1 + 32) setSharedByModifiedByText:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 updateFolderSharingHeader];
}

void sub_10001D1F8(uint64_t a1)
{
  [*(id *)(a1 + 32) setSharedByModifiedByText:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 updateFolderSharingHeader];
}

void sub_10001DE50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void *sub_10001DE88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = cdui_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] got a progress subscriber for file upload", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DF94;
  v7[3] = &unk_10004D2C8;
  id v8 = *(id *)(a1 + 32);
  id v5 = objc_retainBlock(v7);

  return v5;
}

uint64_t sub_10001DF94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001DFA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = cdui_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002E234();
  }

  unsigned int v5 = [v3 BOOLValue];
  if (v5)
  {
    unsigned __int8 v6 = cdui_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002E200();
    }

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finishObserving];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    if (*(void *)(a1 + 32)) {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
}

void sub_10001E070(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = cdui_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002E268();
  }

  [*(id *)(a1 + 32) setShare:v6];
  [*(id *)(a1 + 32) _setContainerFromID:v5];

  id v8 = [*(id *)(a1 + 32) shareCreationSema];
  dispatch_semaphore_signal(v8);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10001E114(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) shareCreationSema];
  dispatch_semaphore_wait(v1, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_10001E15C(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 12000000000);
  if (dispatch_group_wait(v2, v3))
  {
    id v4 = cdui_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002E384();
    }
    goto LABEL_16;
  }
  id v5 = [*(id *)(a1 + 40) share];
  if ([v5 publicPermission] == (id)1)
  {

    goto LABEL_14;
  }
  id v6 = [*(id *)(a1 + 40) share];
  uint64_t v7 = [v6 currentUserParticipant];
  id v8 = [*(id *)(a1 + 40) share];
  id v9 = [v8 owner];
  unsigned int v10 = [v7 isEqual:v9];

  if (!v10)
  {
LABEL_14:
    id v4 = cdui_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002E29C();
    }
    goto LABEL_16;
  }
  id v11 = cdui_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002E350();
  }

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v12 = [*(id *)(a1 + 40) share];
  id v13 = [v12 publicPermission];

  id v14 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10001E494;
  v36[3] = &unk_10004D360;
  v36[4] = v13;
  id v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  v29 = sub_10001E4A0;
  id v30 = &unk_10004D3B0;
  id v16 = *(id *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void **)(a1 + 48);
  v31 = v16;
  uint64_t v32 = v17;
  id v35 = v13;
  id v33 = v18;
  id v34 = *(id *)(a1 + 32);
  [v14 shareViewController:v15 modifyShare:v36 completion:&v27];
  id v19 = *(NSObject **)(a1 + 32);
  dispatch_time_t v20 = dispatch_time(0, 12000000000);
  if (dispatch_group_wait(v19, v20))
  {
    v21 = cdui_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10002E2D0();
    }
  }
  id v4 = v31;
LABEL_16:

  uint64_t v22 = *(void *)(a1 + 72);
  id v23 = [*(id *)(a1 + 40) share];
  (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

  if (*(void *)(a1 + 64)) {
    +[NSProgress _removeSubscriber:](NSProgress, "_removeSubscriber:");
  }
  id v24 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v24) {
    [v24 finishObserving];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 192), "finishObserving", v27, v28, v29, v30);
  uint64_t v25 = *(void *)(a1 + 40);
  id v26 = *(void **)(v25 + 192);
  *(void *)(v25 + 192) = 0;
}

id sub_10001E494(uint64_t a1, void *a2)
{
  return [a2 setPublicPermission:*(void *)(a1 + 32)];
}

void sub_10001E4A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001E580;
  v8[3] = &unk_10004D388;
  id v9 = *(id *)(a1 + 32);
  id v10 = v4;
  uint64_t v5 = *(void *)(a1 + 64);
  id v6 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v14 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 56);
  id v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

void sub_10001E580(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pathExtension];
  if (*(void *)(a1 + 40))
  {
    BRTelemetryReportShareInvitation();
    [*(id *)(a1 + 48) shareViewController:*(void *)(a1 + 56) presentError:*(void *)(a1 + 40)];
  }
  else
  {
    BRTelemetryReportShareInvitation();
    [*(id *)(a1 + 48) shareViewControllerDidChooseTransport:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void sub_10001E69C(uint64_t a1)
{
  id v2 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  dispatch_time_t v3 = [v2 localizedStringForKey:@"STOP_SHARING_MESSAGE_TEXT", @"If you stop sharing, other people will no longer have access to “%@”.", @"Localizable" value table];
  id v4 = [*(id *)(a1 + 32) itemUTI];
  uint64_t v5 = _CDAdaptLocalizedStringForItemType();
  id v6 = [*(id *)(a1 + 32) itemName];
  id v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6);

  id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v9 = [v8 localizedStringForKey:@"STOP_SHARING_TITLE_TEXT" value:@"Stop Sharing?" table:@"Localizable"];
  id v10 = +[UIAlertController alertControllerWithTitle:v9 message:v7 preferredStyle:1];

  uint64_t v11 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v12 = [v11 localizedStringForKey:@"STOP_SHARING_CANCEL_TEXT" value:@"Cancel" table:@"Localizable"];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001E98C;
  v18[3] = &unk_10004D188;
  v18[4] = *(void *)(a1 + 32);
  id v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v18];
  [v10 addAction:v13];

  uint64_t v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  uint64_t v15 = [v14 localizedStringForKey:@"STOP_SHARING_OK_TEXT" value:@"Stop Sharing" table:@"Localizable"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001E9D4;
  void v17[3] = &unk_10004D188;
  v17[4] = *(void *)(a1 + 32);
  id v16 = +[UIAlertAction actionWithTitle:v15 style:2 handler:v17];
  [v10 addAction:v16];

  [*(id *)(a1 + 32) presentViewController:v10 animated:1 completion:0];
}

void sub_10001E98C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) hostingViewController];
  [v1 _dismissViewControllerWithError:0];
}

id sub_10001E9D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _actuallyStopSharing];
}

void sub_10001ED68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = cdui_default_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] stop sharing failed with error %@", buf, 0xCu);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001EEF8;
    v8[3] = &unk_10004CA00;
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] stop sharing succeeded, dismissing", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 32) hostingViewController];
    [v6 _shareWasMadePrivate];

    id v7 = [*(id *)(a1 + 32) hostingViewController];
    [v7 _dismissViewControllerWithError:0];
  }
}

id sub_10001EEF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) shareViewController:0 presentError:*(void *)(a1 + 40)];
}

uint64_t sub_10001EF08(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001EF18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001EF98(uint64_t a1)
{
  id v2 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v3 = [v2 localizedStringForKey:@"LEAVE_SHARE_MESSAGE_TEXT" value:@"Removing yourself will delete “%@” from all your devices." table:@"Localizable"];
  id v4 = [*(id *)(a1 + 32) itemUTI];
  BOOL v5 = _CDAdaptLocalizedStringForItemType();
  id v6 = [*(id *)(a1 + 32) itemName];
  id v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6);

  id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v9 = [v8 localizedStringForKey:@"LEAVE_SHARE_TITLE_TEXT" value:@"Remove Yourself?" table:@"Localizable"];
  id v10 = +[UIAlertController alertControllerWithTitle:v9 message:v7 preferredStyle:1];

  id v11 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v12 = [v11 localizedStringForKey:@"LEAVE_SHARE_CANCEL_TEXT" value:@"Cancel" table:@"Localizable"];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001F288;
  v18[3] = &unk_10004D188;
  v18[4] = *(void *)(a1 + 32);
  id v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v18];
  [v10 addAction:v13];

  uint64_t v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  uint64_t v15 = [v14 localizedStringForKey:@"LEAVE_SHARE_CONTINUE_TEXT" value:@"Continue" table:@"Localizable"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001F2D0;
  void v17[3] = &unk_10004D188;
  v17[4] = *(void *)(a1 + 32);
  id v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v17];
  [v10 addAction:v16];

  [*(id *)(a1 + 32) presentViewController:v10 animated:1 completion:0];
}

void sub_10001F288(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) hostingViewController];
  [v1 _dismissViewControllerWithError:0];
}

id sub_10001F2D0(uint64_t a1)
{
  id v2 = cdui_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[INFO] leaving share: falling through to stop sharing case", v4, 2u);
  }

  return [*(id *)(a1 + 32) _actuallyStopSharing];
}

uint64_t sub_10001F638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

void sub_10001F654(uint64_t a1, void *a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 share];
  id v9 = [v8 recordID];
  id v10 = [v7 objectForKeyedSubscript:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001F858(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unsigned int v7 = +[BRShareSaveOperation shouldRetryShareSaveOnError:v6];
    id v8 = cdui_default_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v5;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] Saving share %@ failed with a recoverable error %@; retrying",
          buf,
          0x16u);
      }

      id v10 = a1[4];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10001FB14;
      v14[3] = &unk_10004D4A0;
      v14[4] = v10;
      id v15 = a1[5];
      id v16 = a1[6];
      id v17 = a1[7];
      [v10 _refetchShareAndRetry:v14];
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v5;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] Saving share %@ failed with a non-recoverable error %@", buf, 0x16u);
      }

      [a1[4] setShare:0];
      (*((void (**)(void))a1[7] + 2))();
    }
  }
  else
  {
    [a1[4] setShare:v5];
    id v11 = cdui_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] Saving share succeeded", buf, 2u);
    }

    [a1[5] shareDidChange];
    (*((void (**)(void))a1[7] + 2))();
    id v12 = [a1[4] hostingViewController];
    if ([a1[4] mode])
    {
      id v13 = [v5 _copyWithoutPersonalInfo];
      [v12 _shareDidChange:v13];
    }
    else
    {
      [v12 _shareDidChange:0];
    }
  }
}

id sub_10001FB14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _modifyAndSaveShare:a2 existingError:a3 controller:*(void *)(a1 + 40) modifyBlock:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void sub_10001FE48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001FF20;
  v11[3] = &unk_10004D4C8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

uint64_t sub_10001FF20(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setInitialSharing:");
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void sub_10001FF70(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v4 = [*(id *)(a1 + 32) folderSharingPreparationError];
  objc_sync_exit(v2);

  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) workerQueue];
    [v3 addOperation:*(void *)(a1 + 40)];
  }
}

void sub_100020014(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020028(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = [a2 lastObject];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100020108;
  v12[3] = &unk_10004D4C8;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v7;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

uint64_t sub_100020108(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setInitialSharing:");
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void sub_100020448(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100020524;
  v11[3] = &unk_10004D070;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

uint64_t sub_100020524(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_handleCopyShareURLError:");
  }
  else {
    [*(id *)(a1 + 40) setShareURL:*(void *)(a1 + 48)];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_100020814(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000208EC;
  v10[3] = &unk_10004D4C8;
  uint64_t v7 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

void sub_1000208EC(uint64_t a1)
{
  [*(id *)(a1 + 32) setShareURL:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) shareURL];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 48));
}

void sub_10002095C(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000209F0;
  v3[3] = &unk_10004D250;
  id v2 = *(id *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_1000209F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) shareURL];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void sub_100020A54(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a3;
  id v7 = [v4 share];
  id v6 = [v7 URL];
  (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v6, v5);
}

void sub_100020DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020E08(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) view];
  [v3 removeFromSuperview];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (v5)
  {
    BRTelemetryReportShareInvitation();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained shareViewController:*(void *)(a1 + 56) presentError:v5];
  }
}

void sub_1000212A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasSuffix:@">"])
  {
    id v4 = objc_msgSend(v3, "substringToIndex:", (char *)objc_msgSend(v3, "length") - 1);
    uint64_t v5 = objc_msgSend(v4, "substringFromIndex:", (char *)objc_msgSend(v3, "rangeOfString:options:", @"<", 4) + 1);

    id v3 = (id)v5;
  }
  if (IMStringIsEmail())
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [objc_alloc((Class)CKUserIdentityLookupInfo) initWithEmailAddress:v3];
    [v6 addObject:v7];

    id v8 = cdui_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] Looking up recipient %@ as email", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    int IsPhoneNumber = IMStringIsPhoneNumber();
    id v10 = cdui_default_log();
    id v11 = v10;
    if (IsPhoneNumber)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] Looking up recipient %@ as phone#", (uint8_t *)&v14, 0xCu);
      }

      id v12 = *(void **)(a1 + 32);
      id v13 = [objc_alloc((Class)CKUserIdentityLookupInfo) initWithPhoneNumber:v3];
      [v12 addObject:v13];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Participant %@ is neither email nor phone number. Trying to add as phone number anyway.", (uint8_t *)&v14, 0xCu);
      }

      [*(id *)(a1 + 40) addObject:v3];
    }
  }
}

void sub_1000214D4(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = objc_opt_new();
  if (v9) {
    [v6 setObject:v9 forKey:NSUnderlyingErrorKey];
  }
  if (v5) {
    [v6 setObject:v5 forKey:@"addr"];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = +[NSError errorWithDomain:@"_UIShareErrorDomain" code:0 userInfo:v6];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void sub_1000215C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = cdui_default_log();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10002E478((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000217BC;
    block[3] = &unk_10004D250;
    id v28 = *(id *)(a1 + 48);
    id v27 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    id v15 = v28;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002E444();
    }

    id v16 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000217D0;
    v23[3] = &unk_10004D628;
    v23[4] = v16;
    id v18 = v5;
    uint64_t v19 = *(void *)(a1 + 56);
    id v24 = v18;
    uint64_t v25 = v19;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100021A14;
    v20[3] = &unk_10004D048;
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    [v16 shareViewController:v17 modifyShare:v23 completion:v20];

    id v15 = v24;
  }
}

uint64_t sub_1000217BC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1000217D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) allowInvitingOthers])
  {
    id v4 = [v3 owner];
    unsigned int v20 = [v4 isCurrentUser];
  }
  else
  {
    unsigned int v20 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v22;
    if (v20) {
      CFStringRef v10 = @"Y";
    }
    else {
      CFStringRef v10 = @"N";
    }
    CFStringRef v19 = v10;
    *(void *)&long long v7 = 138412802;
    long long v18 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "setPermission:", *(void *)(a1 + 48), v18, v19);
        if (*(void *)(a1 + 48) == 3)
        {
          uint64_t v13 = +[UIShareFeature coOwners];
          unsigned int v14 = [v13 isEnabled];

          if (v14)
          {
            if (v20) {
              uint64_t v15 = 2;
            }
            else {
              uint64_t v15 = (uint64_t)[v12 role];
            }
            [v12 setRole:v15];
          }
        }
        id v16 = cdui_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = *(void *)(a1 + 48);
          *(_DWORD *)buf = v18;
          id v26 = v12;
          __int16 v27 = 2048;
          uint64_t v28 = v17;
          __int16 v29 = 2112;
          CFStringRef v30 = v19;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] adding participant %@ with permission %li, isAbleToInvite: %@", buf, 0x20u);
        }

        [v3 addParticipant:v12];
      }
      id v8 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v8);
  }
}

void sub_100021A14(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1000178BC;
  void v10[4] = sub_1000178CC;
  id v11 = v4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021B20;
  block[3] = &unk_10004D650;
  uint64_t v9 = v10;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v10, 8);
}

uint64_t sub_100021B20(uint64_t a1)
{
  uint64_t v2 = a1 + 48;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v3)
  {
    NSErrorUserInfoKey v11 = NSUnderlyingErrorKey;
    uint64_t v12 = v3;
    id v4 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v5 = +[NSError errorWithDomain:@"_UIShareErrorDomain" code:0 userInfo:v4];
    uint64_t v6 = *(void *)(*(void *)v2 + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = cdui_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10002E518();
    }

    [*(id *)(a1 + 32) presentError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  else
  {
    uint64_t v9 = cdui_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10002E4E4();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100021C90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100021CA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPermission:*(void *)(a1 + 40)];
  id v4 = cdui_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002E588((uint64_t)v3, (uint64_t *)(a1 + 40), v4);
  }

  [*(id *)(a1 + 32) addObject:v3];
}

uint64_t sub_100021D1C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

void sub_100022704(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = +[NSString stringWithFormat:@"#%@#", a2];
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 2, 0, objc_msgSend(*(id *)(a1 + 32), "length"));
}

void sub_1000227AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000227EC(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000227F8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_10002431C(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [*(id *)(a1 + 32) participants];
  id v3 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v27;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "currentParticipants", context);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1000245DC;
        v25[3] = &unk_10004D758;
        v25[4] = v7;
        id v9 = [v8 indexOfObjectPassingTest:v25];

        if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v10 = (id)objc_opt_new();
        }
        else
        {
          NSErrorUserInfoKey v11 = [*(id *)(a1 + 40) currentParticipants];
          uint64_t v12 = [v11 objectAtIndex:v9];
          id v10 = [v12 copy];
        }
        [v10 setParticipant:v7];
        [v2 addObject:v10];
      }
      id v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) setCurrentParticipants:v2];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v2;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
        if ((objc_msgSend(v18, "fullyLookedUp", context) & 1) == 0) {
          [*(id *)(a1 + 40) _scheduleParticipantLookup:v18];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v15);
  }

  [*(id *)(a1 + 40) processUpdate:v13 changedObjects:0];
}

id sub_1000245DC(uint64_t a1, void *a2)
{
  id v3 = [a2 participant];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_1000246D4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) currentParticipants];
  id v4 = [v3 indexOfObject:*(void *)(a1 + 40)];

  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [*(id *)(a1 + 32) currentParticipants];
    id v6 = [v5 objectAtIndex:v4];

    if (([v6 fullyLookedUp] & 1) == 0)
    {
      uint64_t v7 = cdui_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [v6 participant];
        id v9 = [v8 userIdentity];
        id v10 = [v9 lookupInfo];
        NSErrorUserInfoKey v11 = [v10 emailAddress];
        uint64_t v12 = v11;
        if (!v11)
        {
          id v39 = [v6 participant];
          v37 = [v39 userIdentity];
          id v35 = [v37 lookupInfo];
          uint64_t v12 = [v35 phoneNumber];
        }
        *(_DWORD *)buf = 138412290;
        v44 = v12;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] looking up participant %@", buf, 0xCu);
        if (!v11)
        {
        }
      }

      id v13 = [v6 copy];
      id v14 = +[CNContactViewController descriptorForRequiredKeys];
      v42[0] = v14;
      id v15 = +[CNQuickActionsView descriptorForRequiredKeys];
      v42[1] = v15;
      v42[2] = *(void *)(*(void *)(a1 + 32) + 24);
      uint64_t v16 = +[NSArray arrayWithObjects:v42 count:3];

      uint64_t v17 = +[_UIShareInvitationAddParticipantController contactStore];
      long long v18 = [v6 participant];
      v40 = (void *)v16;
      id v41 = 0;
      v38 = (void *)v17;
      CFStringRef v19 = [v18 unifiedContactsInStore:v17 keysToFetch:v16 error:&v41];
      id v36 = v41;
      unsigned int v20 = [v19 firstObject];

      if (v20)
      {
        long long v21 = cdui_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[INFO] found record in contact store", buf, 2u);
        }
      }
      else
      {
        long long v22 = [*(id *)(a1 + 40) participant];
        long long v21 = [v22 userIdentity];

        long long v23 = [v21 nameComponents];
        id v34 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v23 style:0 options:0];

        long long v24 = [v21 lookupInfo];
        uint64_t v25 = [v24 emailAddress];
        long long v26 = v25;
        if (v25)
        {
          id v27 = v25;
        }
        else
        {
          long long v28 = [v21 lookupInfo];
          id v27 = [v28 phoneNumber];
        }
        unsigned int v20 = +[CNContact contactWithDisplayName:v34 emailOrPhoneNumber:v27];
        long long v29 = cdui_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v34;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[INFO] no record found, synthesizing record from user identity (%@)", buf, 0xCu);
        }
      }
      [v13 setContact:v20];
      [v13 setFullyLookedUp:1];
      CFStringRef v30 = [*(id *)(a1 + 32) currentParticipants];
      id v31 = [v30 mutableCopy];

      [v31 replaceObjectAtIndex:v4 withObject:v13];
      [*(id *)(a1 + 32) setCurrentParticipants:v31];
      uint64_t v32 = *(void **)(a1 + 32);
      id v33 = +[NSSet setWithObject:v13];
      [v32 processUpdate:v31 changedObjects:v33];
    }
  }
}

void sub_100026BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
}

void sub_100026BF8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a3 && a2 && !a4)
  {
    id v6 = a3;
    id v7 = a2;
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    id v9 = [*(id *)(a1 + 32) _ownerLabelTextForName:v7 displayHandle:v6];

    id v8 = [*(id *)(*(void *)(a1 + 32) + 112) ownerLabel];
    [v8 setAttributedText:v9];
  }
}

void sub_100026CC4(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v9 = a2;
  id v10 = a4;
  if (v9 && !a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026DA4;
    block[3] = &unk_10004CCE8;
    id v12 = *(id *)(a1 + 32);
    id v13 = v9;
    id v14 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100026DA4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _ownerLabelTextForName:*(void *)(a1 + 40) displayHandle:*(void *)(a1 + 48)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) ownerLabel];
  [v2 setAttributedText:v3];
}

void sub_100026E1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 shareViewControllerDidFinishActivity:WeakRetained];
}

void sub_100027E20(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 traitCollection];
  [v1 updatePreferredContentSize:v2];
}

id sub_100028658(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setProgress:a2];
}

uint64_t sub_100028664(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:&__NSDictionary0__struct];
    [v3 presentError:v4];
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

void sub_1000288FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [*(id *)(a1 + 32) presentError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100028B4C(uint64_t a1)
{
  id v2 = cdui_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[INFO] activity controller preparation finished", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028FCC(uint64_t a1)
{
  id v2 = cdui_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002E8E8(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  dispatch_group_t v10 = dispatch_group_create();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000290B0;
  block[3] = &unk_10004CCE8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  dispatch_group_t v15 = v10;
  uint64_t v16 = v11;
  id v17 = v12;
  id v13 = v10;
  dispatch_group_async(v13, (dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_1000290B0(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v2 = [*(id *)(a1 + 40) delegate];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) activity];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100029218;
  v10[3] = &unk_10004D900;
  uint64_t v5 = *(void **)(a1 + 48);
  void v10[4] = *(void *)(a1 + 40);
  id v11 = v5;
  id v12 = v2;
  id v13 = *(id *)(a1 + 32);
  id v6 = v2;
  [v6 shareViewController:v3 willStartActivity:v4 completion:v10];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000296B8;
  v8[3] = &unk_10004D928;
  void v8[4] = v7;
  id v9 = *(id *)(a1 + 32);
  [v6 shareViewControllerCopyShareURL:v7 completion:v8];
}

void sub_100029218(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = cdui_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002E9DC(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = [*(id *)(a1 + 32) embeddedActivityViewController];
  [v12 setVcForActivityPresentation:v3];

  id v13 = cdui_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10002E958(a1 + 32);
  }

  id v14 = [*(id *)(a1 + 40) activity];
  dispatch_group_t v15 = [v14 activityType];

  uint64_t v16 = [*(id *)(a1 + 32) share];
  id v17 = [v16 publicPermission];

  if (([v15 isEqualToString:UIActivityTypeMail] & 1) == 0
    && ([v15 isEqualToString:UIActivityTypeMessage] & 1) == 0)
  {
    long long v18 = *(void **)(a1 + 32);
    CFStringRef v19 = [*(id *)(a1 + 40) activity];
    unsigned int v20 = [v19 applicationExtension];
    long long v21 = [v20 identifier];
    unsigned __int8 v22 = [v18 isHomeroomID:v21];

    if (v17 == (id)1 && (v22 & 1) == 0)
    {
      long long v23 = cdui_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_10002E920(v23, v24, v25, v26, v27, v28, v29, v30);
      }

      id v31 = [*(id *)(a1 + 48) shareViewControllerItemUTI:*(void *)(a1 + 32)];
      uint64_t v32 = [_UIShareInvitationModalAddParticipantController alloc];
      id v33 = [*(id *)(a1 + 32) share];
      id v34 = [(_UIShareInvitationModalAddParticipantController *)v32 initWithShare:v33 uti:v31];

      dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
      v38 = _NSConcreteStackBlock;
      uint64_t v39 = 3221225472;
      v40 = sub_100029538;
      id v41 = &unk_10004D8D8;
      uint64_t v42 = *(void *)(a1 + 32);
      id v43 = *(id *)(a1 + 48);
      id v44 = *(id *)(a1 + 56);
      id v35 = v15;
      id v45 = v35;
      [(_UIShareInvitationModalAddParticipantController *)v34 setCompletion:&v38];
      if (objc_msgSend(v35, "isEqualToString:", @"com.apple.CloudDocsUI.CopyShareLinkActivity", v38, v39, v40, v41, v42))
      {
        id v36 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v37 = [v36 localizedStringForKey:@"COPY_LINK_ACTION_TEXT" value:@"Copy Link" table:@"Localizable"];
        [(_UIShareInvitationModalAddParticipantController *)v34 setContinueActionTitle:v37];
      }
      [v3 presentViewController:v34 animated:1 completion:0];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_100029538(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
    [v6 presentError:v7];

    [*(id *)(a1 + 40) shareViewControllerDismiss:*(void *)(a1 + 32)];
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    id v11 = [*(id *)(v9 + 128) defaultPermission];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100029674;
    v12[3] = &unk_10004D8B0;
    void v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    [v8 shareViewController:v9 addParticipants:v5 activityType:v10 permission:v11 completion:v12];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100029674(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) presentError:a2];
  }
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_1000296B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setShareURL:a2];
  if (v5) {
    [*(id *)(a1 + 32) presentError:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100029868(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) navigationItem];
  id v2 = [v3 rightBarButtonItem];
  [v2 _setHidden:v1];
}

void sub_100029B78(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_100029B98(uint64_t a1)
{
  return *(void *)a1;
}

double sub_100029E48(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7)
{
  if (a5 != 0.0 && a6 != 0.0)
  {
    double v10 = a7;
    if (a7 == 0.0)
    {
      id v14 = +[UIScreen mainScreen];
      dispatch_group_t v15 = [v14 traitCollection];
      [v15 displayScale];
      double v10 = v16;

      if (v10 == 0.0) {
        double v10 = 1.0;
      }
    }
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.width = a3;
    v24.size.height = a4;
    double Width = CGRectGetWidth(v24);
    v25.origin.x = a1;
    v25.origin.y = a2;
    v25.size.width = a3;
    v25.size.height = a4;
    double v18 = fmin(Width / a5, CGRectGetHeight(v25) / a6);
    double v19 = ceil(v10 * (a5 * v18)) / v10;
    CGFloat v20 = ceil(v10 * (a6 * v18)) / v10;
    v26.origin.x = a1;
    v26.origin.y = a2;
    v26.size.width = a3;
    v26.size.height = a4;
    double v21 = CGRectGetWidth(v26);
    v27.origin.x = a1;
    v27.origin.y = a2;
    v27.size.width = v19;
    v27.size.height = v20;
    CGFloat v22 = a1 + floor(v10 * ((v21 - CGRectGetWidth(v27)) * 0.5)) / v10;
    v28.origin.x = a1;
    v28.origin.y = a2;
    v28.size.width = a3;
    v28.size.height = a4;
    CGRectGetHeight(v28);
    v29.origin.x = v22;
    v29.origin.y = a2;
    v29.size.width = v19;
    v29.size.height = v20;
    CGRectGetHeight(v29);
    if (v19 >= 1.0) {
      return v19;
    }
    else {
      return 1.0;
    }
  }
  return a3;
}

void sub_10002A874(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v18 = v2;
    uint64_t v19 = v3;
    id v5 = cdui_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10002EAC4(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002A93C;
    v15[3] = &unk_10004CA00;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v16 = v13;
    uint64_t v17 = v14;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

id sub_10002A93C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)_BRShareOverviewActivityViewController;
  return objc_msgSendSuper2(&v3, "_performActivity:", v1);
}

void sub_10002AAC4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002AB80;
  v7[3] = &unk_10004D098;
  id v5 = v2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 56);
  [v5 shareActivityController:v3 prepareActivityPresentation:v4 completion:v7];
}

uint64_t sub_10002AB80(uint64_t a1)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([*(id *)(a1 + 32) shareActivityControllerShouldAddParticipants:*(void *)(a1 + 40)])objc_msgSend(*(id *)(a1 + 40), "setupActivityDelegate"); {
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }

  return v2();
}

uint64_t sub_10002AD3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002B188(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) mailComposeController:*(void *)(a1 + 40) didFinishWithResult:0 error:v3];
  }
}

id sub_10002B338(void *a1, uint64_t a2)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v4 = *(void (**)(void))(a1[6] + 16);
  if (a2)
  {
    v4();
    id v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    return [v5 messageComposeViewController:v6 didFinishWithResult:0];
  }
  else
  {
    return (id)((uint64_t (*)(void))v4)();
  }
}

uint64_t sub_10002D7E4()
{
  return 0;
}

void sub_10002DC58(id *a1, NSObject *a2)
{
  id v3 = [*a1 contact];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[ERROR] Participant %@ should have been modified, but just went away instead", (uint8_t *)&v4, 0xCu);
}

void sub_10002DCF4(uint64_t a1, uint64_t a2, os_log_t log)
{
  CFStringRef v3 = @"Y";
  if (!*(unsigned char *)(a1 + 16)) {
    CFStringRef v3 = @"N";
  }
  int v4 = 138412546;
  CFStringRef v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] applyToShare has ACL: %@, share: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10002DD98()
{
  sub_1000110C0();
  sub_1000110A4((void *)&_mh_execute_header, v0, v1, "[ERROR] Selected property %@ is neither mail nor phone number? Trying as email anyway.", v2, v3, v4, v5, v6);
}

void sub_10002DE00()
{
  sub_1000110C0();
  sub_1000110A4((void *)&_mh_execute_header, v0, v1, "[ERROR] Couldn't create recipient for phone number contact %@", v2, v3, v4, v5, v6);
}

void sub_10002DE68()
{
  sub_1000110C0();
  sub_1000110A4((void *)&_mh_execute_header, v0, v1, "[ERROR] compose recipient %@ doesn't have a display name?", v2, v3, v4, v5, v6);
}

void sub_10002DED0()
{
  sub_1000227EC(__stack_chk_guard);
  sub_100022818();
  sub_1000110A4((void *)&_mh_execute_header, v0, v1, "[ERROR] existing subshare preflight check error: %@", v2, v3, v4, v5, v6);
}

void sub_10002DF38()
{
  sub_1000227D4();
  sub_1000227F8((void *)&_mh_execute_header, v0, v1, "[ERROR] thumbnail request operation on %@ failed: %@");
}

void sub_10002DFA4()
{
  sub_1000227EC(__stack_chk_guard);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v1 + 104);
  uint64_t v3 = *(void *)(v1 + 136);
  int v6 = 138412802;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v2;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "[ERROR] Decrypting share failed with error %@. Share was %@, container was %@", (uint8_t *)&v6, 0x20u);
}

void sub_10002E050()
{
  sub_1000227C8();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "[ERROR] ContainerID is nil before attempting to create CKContainer--this is fatal", v1, 2u);
}

void sub_10002E090(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E0FC()
{
  sub_1000227EC(__stack_chk_guard);
  sub_1000227D4();
  sub_1000227F8((void *)&_mh_execute_header, v0, v1, "[ERROR] error calling -br_topLevelSharedFolderForURL:error: on %@: %@");
}

void sub_10002E164()
{
  sub_1000227C8();
  sub_1000227AC((void *)&_mh_execute_header, v0, v1, "[DEBUG] waiting to be uploaded", v2, v3, v4, v5, v6);
}

void sub_10002E198()
{
  sub_1000227C8();
  sub_1000227AC((void *)&_mh_execute_header, v0, v1, "[DEBUG] calling out to host to request preparation of CK share", v2, v3, v4, v5, v6);
}

void sub_10002E1CC()
{
  sub_1000227C8();
  sub_1000227AC((void *)&_mh_execute_header, v0, v1, "[DEBUG] we have a preexisting CK share, no wait necessary", v2, v3, v4, v5, v6);
}

void sub_10002E200()
{
  sub_1000227C8();
  sub_1000227AC((void *)&_mh_execute_header, v0, v1, "[DEBUG] upload state is YES", v2, v3, v4, v5, v6);
}

void sub_10002E234()
{
  sub_1000227C8();
  sub_1000227AC((void *)&_mh_execute_header, v0, v1, "[DEBUG] upload state upload received", v2, v3, v4, v5, v6);
}

void sub_10002E268()
{
  sub_1000227C8();
  sub_1000227AC((void *)&_mh_execute_header, v0, v1, "[DEBUG] preparation finished", v2, v3, v4, v5, v6);
}

void sub_10002E29C()
{
  sub_1000227C8();
  sub_1000227AC((void *)&_mh_execute_header, v0, v1, "[DEBUG] finished waiting for upload and still has ACL", v2, v3, v4, v5, v6);
}

void sub_10002E2D0()
{
  sub_100022818();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] timeout (%llu)  waiting for uploadAndSave(2--save/modify)", v1, 0xCu);
}

void sub_10002E350()
{
  sub_1000227C8();
  sub_1000227AC((void *)&_mh_execute_header, v0, v1, "[DEBUG] finished waiting for upload and should be saving for public", v2, v3, v4, v5, v6);
}

void sub_10002E384()
{
  sub_100022818();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] timeout (%llu)  waiting for uploadAndSave(1--upload)", v1, 0xCu);
}

void sub_10002E404()
{
  sub_1000227C8();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "[ERROR] No window to display Finishing view controller on", v1, 2u);
}

void sub_10002E444()
{
  sub_1000227C8();
  sub_1000227AC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Participants looked up without error, saving", v2, v3, v4, v5, v6);
}

void sub_10002E478(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E4E4()
{
  sub_1000227C8();
  sub_1000227AC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Saving with new participants was successful", v2, v3, v4, v5, v6);
}

void sub_10002E518()
{
  sub_1000227EC(__stack_chk_guard);
  sub_100022818();
  sub_1000110A4((void *)&_mh_execute_header, v0, v1, "[ERROR] Save after participant lookup failed with error %@", v2, v3, v4, v5, v6);
}

void sub_10002E588(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] adding participant %@ with permission %li", (uint8_t *)&v4, 0x16u);
}

void sub_10002E6AC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [(id)sub_100029B98(a1) description];
  int v6 = 134218242;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Initial share, permissions: %lu, creating new settings %@", (uint8_t *)&v6, 0x16u);
}

void sub_10002E75C(uint64_t a1)
{
  uint64_t v1 = [(id)sub_100029B98(a1) description];
  sub_1000110C0();
  sub_100029B78((void *)&_mh_execute_header, v2, v3, "[DEBUG] Existing private share, copying settings %@", v4, v5, v6, v7, v8);
}

void sub_10002E7E0(uint64_t a1)
{
  uint64_t v1 = [(id)sub_100029B98(a1) description];
  sub_1000110C0();
  sub_100029B78((void *)&_mh_execute_header, v2, v3, "[DEBUG] Existing public share, copying settings %@", v4, v5, v6, v7, v8);
}

void sub_10002E864(void *a1)
{
  uint64_t v1 = [a1 settings];
  sub_1000110C0();
  sub_100029B78((void *)&_mh_execute_header, v2, v3, "[DEBUG] received new settings from settings controller, %@", v4, v5, v6, v7, v8);
}

void sub_10002E8E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E920(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E958(uint64_t a1)
{
  uint64_t v1 = [(id)sub_100029B98(a1) share];
  sub_1000110C0();
  sub_100029B78((void *)&_mh_execute_header, v2, v3, "[DEBUG] operation share is %@", v4, v5, v6, v7, v8);
}

void sub_10002E9DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EA14(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[ERROR] Attempting to assign image with zero width or height: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10002EA8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EAC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EAFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EB34(void *a1, NSObject *a2)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  id v6 = [a1 modalPresentationStyle];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Presenting share activity %@ as mode %li", (uint8_t *)&v3, 0x16u);
}

uint64_t BRAllowFolderSharing()
{
  return _BRAllowFolderSharing();
}

uint64_t BRFormatPhoneNumber()
{
  return _BRFormatPhoneNumber();
}

uint64_t BRLayerSnapshot()
{
  return _BRLayerSnapshot();
}

uint64_t BRSharingCopyCurrentUserNameAndDisplayHandle()
{
  return _BRSharingCopyCurrentUserNameAndDisplayHandle();
}

uint64_t BRSharingCopyCurrentUserNameAndDisplayHandleForURL()
{
  return _BRSharingCopyCurrentUserNameAndDisplayHandleForURL();
}

uint64_t BRSharingCreateShareForItemAtURL()
{
  return _BRSharingCreateShareForItemAtURL();
}

uint64_t BRTelemetryReportShareInvitation()
{
  return _BRTelemetryReportShareInvitation();
}

uint64_t CDAddLocalizedSuffixForType()
{
  return _CDAddLocalizedSuffixForType();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CPIsInternalDevice()
{
  return _CPIsInternalDevice();
}

uint64_t FPURLMightBeInFileProvider()
{
  return _FPURLMightBeInFileProvider();
}

uint64_t IMStringIsEmail()
{
  return _IMStringIsEmail();
}

uint64_t IMStringIsPhoneNumber()
{
  return _IMStringIsPhoneNumber();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return _UTTypeConformsTo(inUTI, inConformsToUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return _UTTypeCreatePreferredIdentifierForTag(inTagClass, inTag, inConformingToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CDAdaptLocalizedStringForItemType()
{
  return __CDAdaptLocalizedStringForItemType();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return __CFURLPromiseCopyPhysicalURL();
}

uint64_t _UIAdaptLocalizedStringForView()
{
  return __UIAdaptLocalizedStringForView();
}

uint64_t _UIBarsApplyChromelessEverywhere()
{
  return __UIBarsApplyChromelessEverywhere();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t cdui_default_log()
{
  return _cdui_default_log();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_HTMLFragmentString(void *a1, const char *a2, ...)
{
  return [a1 HTMLFragmentString];
}

id objc_msgSend_UIImage(void *a1, const char *a2, ...)
{
  return [a1 UIImage];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__actuallyStopSharing(void *a1, const char *a2, ...)
{
  return [a1 _actuallyStopSharing];
}

id objc_msgSend__cloudSharingControllerDidActivateShowSharedFolder(void *a1, const char *a2, ...)
{
  return [a1 _cloudSharingControllerDidActivateShowSharedFolder];
}

id objc_msgSend__copyWithoutPersonalInfo(void *a1, const char *a2, ...)
{
  return [a1 _copyWithoutPersonalInfo];
}

id objc_msgSend__documentsApplicationProxy(void *a1, const char *a2, ...)
{
  return [a1 _documentsApplicationProxy];
}

id objc_msgSend__folderSubitemName(void *a1, const char *a2, ...)
{
  return [a1 _folderSubitemName];
}

id objc_msgSend__hasACLFromPermissionOptions(void *a1, const char *a2, ...)
{
  return [a1 _hasACLFromPermissionOptions];
}

id objc_msgSend__headerSubtitle(void *a1, const char *a2, ...)
{
  return [a1 _headerSubtitle];
}

id objc_msgSend__hidden(void *a1, const char *a2, ...)
{
  return [a1 _hidden];
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _hostApplicationBundleIdentifier];
}

id objc_msgSend__hostApplicationType(void *a1, const char *a2, ...)
{
  return [a1 _hostApplicationType];
}

id objc_msgSend__initialHeaderSubtitle(void *a1, const char *a2, ...)
{
  return [a1 _initialHeaderSubtitle];
}

id objc_msgSend__loadInitialViewController(void *a1, const char *a2, ...)
{
  return [a1 _loadInitialViewController];
}

id objc_msgSend__mailSubject(void *a1, const char *a2, ...)
{
  return [a1 _mailSubject];
}

id objc_msgSend__mailTemplate(void *a1, const char *a2, ...)
{
  return [a1 _mailTemplate];
}

id objc_msgSend__messageTemplate(void *a1, const char *a2, ...)
{
  return [a1 _messageTemplate];
}

id objc_msgSend__permissionFromPermissionOptions(void *a1, const char *a2, ...)
{
  return [a1 _permissionFromPermissionOptions];
}

id objc_msgSend__prepareForFolderSharingIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _prepareForFolderSharingIfNeeded];
}

id objc_msgSend__presentedURLChanged(void *a1, const char *a2, ...)
{
  return [a1 _presentedURLChanged];
}

id objc_msgSend__presentedURLDeleted(void *a1, const char *a2, ...)
{
  return [a1 _presentedURLDeleted];
}

id objc_msgSend__registerObserver(void *a1, const char *a2, ...)
{
  return [a1 _registerObserver];
}

id objc_msgSend__rootFolderTitle(void *a1, const char *a2, ...)
{
  return [a1 _rootFolderTitle];
}

id objc_msgSend__scheduleParticipantUpdate(void *a1, const char *a2, ...)
{
  return [a1 _scheduleParticipantUpdate];
}

id objc_msgSend__sections(void *a1, const char *a2, ...)
{
  return [a1 _sections];
}

id objc_msgSend__sendSettingsControllerDidChange(void *a1, const char *a2, ...)
{
  return [a1 _sendSettingsControllerDidChange];
}

id objc_msgSend__sendSettingsControllerDidChangeAllowInviters(void *a1, const char *a2, ...)
{
  return [a1 _sendSettingsControllerDidChangeAllowInviters];
}

id objc_msgSend__setupProgressView(void *a1, const char *a2, ...)
{
  return [a1 _setupProgressView];
}

id objc_msgSend__setupViewControllerInContainedNavController(void *a1, const char *a2, ...)
{
  return [a1 _setupViewControllerInContainedNavController];
}

id objc_msgSend__shareWasMadePrivate(void *a1, const char *a2, ...)
{
  return [a1 _shareWasMadePrivate];
}

id objc_msgSend__updateAllowInvitingFromShare(void *a1, const char *a2, ...)
{
  return [a1 _updateAllowInvitingFromShare];
}

id objc_msgSend__updateCloudDocsShare(void *a1, const char *a2, ...)
{
  return [a1 _updateCloudDocsShare];
}

id objc_msgSend__updateCloudKitShare(void *a1, const char *a2, ...)
{
  return [a1 _updateCloudKitShare];
}

id objc_msgSend__updateEstimatedHeightsForDynamicTypeChange(void *a1, const char *a2, ...)
{
  return [a1 _updateEstimatedHeightsForDynamicTypeChange];
}

id objc_msgSend__updateInfo(void *a1, const char *a2, ...)
{
  return [a1 _updateInfo];
}

id objc_msgSend__updateOverrideTraitsForModallyPresentedAddPeopleController(void *a1, const char *a2, ...)
{
  return [a1 _updateOverrideTraitsForModallyPresentedAddPeopleController];
}

id objc_msgSend__updateSendButton(void *a1, const char *a2, ...)
{
  return [a1 _updateSendButton];
}

id objc_msgSend__updateSubviewsForNewGeometry(void *a1, const char *a2, ...)
{
  return [a1 _updateSubviewsForNewGeometry];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_acceptanceStatus(void *a1, const char *a2, ...)
{
  return [a1 acceptanceStatus];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_activitySettingsImage(void *a1, const char *a2, ...)
{
  return [a1 activitySettingsImage];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_addParticipantController(void *a1, const char *a2, ...)
{
  return [a1 addParticipantController];
}

id objc_msgSend_addPeopleViewController(void *a1, const char *a2, ...)
{
  return [a1 addPeopleViewController];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_addressHeightConstraint(void *a1, const char *a2, ...)
{
  return [a1 addressHeightConstraint];
}

id objc_msgSend_addressView(void *a1, const char *a2, ...)
{
  return [a1 addressView];
}

id objc_msgSend_allParticipants(void *a1, const char *a2, ...)
{
  return [a1 allParticipants];
}

id objc_msgSend_allSubViews(void *a1, const char *a2, ...)
{
  return [a1 allSubViews];
}

id objc_msgSend_allowInviteToggle(void *a1, const char *a2, ...)
{
  return [a1 allowInviteToggle];
}

id objc_msgSend_allowInvitingOthers(void *a1, const char *a2, ...)
{
  return [a1 allowInvitingOthers];
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return [a1 appName];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return [a1 application];
}

id objc_msgSend_applicationBundleIdenfier(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIdenfier];
}

id objc_msgSend_applicationExtension(void *a1, const char *a2, ...)
{
  return [a1 applicationExtension];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_aspectRatioConstraint(void *a1, const char *a2, ...)
{
  return [a1 aspectRatioConstraint];
}

id objc_msgSend_avatarViewController(void *a1, const char *a2, ...)
{
  return [a1 avatarViewController];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottom(void *a1, const char *a2, ...)
{
  return [a1 bottom];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return [a1 capitalizedString];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_centeredTitleView(void *a1, const char *a2, ...)
{
  return [a1 centeredTitleView];
}

id objc_msgSend_changeToTopLevelSharedFolderURL(void *a1, const char *a2, ...)
{
  return [a1 changeToTopLevelSharedFolderURL];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return [a1 children];
}

id objc_msgSend_classForCoder(void *a1, const char *a2, ...)
{
  return [a1 classForCoder];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearText(void *a1, const char *a2, ...)
{
  return [a1 clearText];
}

id objc_msgSend_closeButton(void *a1, const char *a2, ...)
{
  return [a1 closeButton];
}

id objc_msgSend_coOwners(void *a1, const char *a2, ...)
{
  return [a1 coOwners];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completelyMatchedAttributedStrings(void *a1, const char *a2, ...)
{
  return [a1 completelyMatchedAttributedStrings];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_composeRecipient(void *a1, const char *a2, ...)
{
  return [a1 composeRecipient];
}

id objc_msgSend_configureWithTransparentBackground(void *a1, const char *a2, ...)
{
  return [a1 configureWithTransparentBackground];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
}

id objc_msgSend_containedNavController(void *a1, const char *a2, ...)
{
  return [a1 containedNavController];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_contentLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 contentLayoutGuide];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createUnreachableViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 createUnreachableViewControllerIfNecessary];
}

id objc_msgSend_currentParticipants(void *a1, const char *a2, ...)
{
  return [a1 currentParticipants];
}

id objc_msgSend_currentParticipantsState(void *a1, const char *a2, ...)
{
  return [a1 currentParticipantsState];
}

id objc_msgSend_currentSearchTaskID(void *a1, const char *a2, ...)
{
  return [a1 currentSearchTaskID];
}

id objc_msgSend_currentUserIsOwner(void *a1, const char *a2, ...)
{
  return [a1 currentUserIsOwner];
}

id objc_msgSend_currentUserIsOwnerOrAdmin(void *a1, const char *a2, ...)
{
  return [a1 currentUserIsOwnerOrAdmin];
}

id objc_msgSend_currentUserParticipant(void *a1, const char *a2, ...)
{
  return [a1 currentUserParticipant];
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dataRepresentation];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return [a1 defaultMetrics];
}

id objc_msgSend_defaultPermission(void *a1, const char *a2, ...)
{
  return [a1 defaultPermission];
}

id objc_msgSend_defaultTarget(void *a1, const char *a2, ...)
{
  return [a1 defaultTarget];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_detailLabel(void *a1, const char *a2, ...)
{
  return [a1 detailLabel];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_disappearingViewController(void *a1, const char *a2, ...)
{
  return [a1 disappearingViewController];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return [a1 displayString];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_editableParticipants(void *a1, const char *a2, ...)
{
  return [a1 editableParticipants];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_embeddedActivityViewController(void *a1, const char *a2, ...)
{
  return [a1 embeddedActivityViewController];
}

id objc_msgSend_endAppearanceTransition(void *a1, const char *a2, ...)
{
  return [a1 endAppearanceTransition];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_existingRecipients(void *a1, const char *a2, ...)
{
  return [a1 existingRecipients];
}

id objc_msgSend_finishAndReturnParticipants(void *a1, const char *a2, ...)
{
  return [a1 finishAndReturnParticipants];
}

id objc_msgSend_finishEnteringRecipient(void *a1, const char *a2, ...)
{
  return [a1 finishEnteringRecipient];
}

id objc_msgSend_finishObserving(void *a1, const char *a2, ...)
{
  return [a1 finishObserving];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_folderSharingPreparationDidComplete(void *a1, const char *a2, ...)
{
  return [a1 folderSharingPreparationDidComplete];
}

id objc_msgSend_folderSharingPreparationError(void *a1, const char *a2, ...)
{
  return [a1 folderSharingPreparationError];
}

id objc_msgSend_folderSharingPreparationGroup(void *a1, const char *a2, ...)
{
  return [a1 folderSharingPreparationGroup];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_forceParticipantUpdate(void *a1, const char *a2, ...)
{
  return [a1 forceParticipantUpdate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frameLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 frameLayoutGuide];
}

id objc_msgSend_fullscreenRepresentationGroup(void *a1, const char *a2, ...)
{
  return [a1 fullscreenRepresentationGroup];
}

id objc_msgSend_fullyLookedUp(void *a1, const char *a2, ...)
{
  return [a1 fullyLookedUp];
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return [a1 generalPasteboard];
}

id objc_msgSend_grayedOut(void *a1, const char *a2, ...)
{
  return [a1 grayedOut];
}

id objc_msgSend_hContainer(void *a1, const char *a2, ...)
{
  return [a1 hContainer];
}

id objc_msgSend_hasACL(void *a1, const char *a2, ...)
{
  return [a1 hasACL];
}

id objc_msgSend_hasPreparedForFolderSharing(void *a1, const char *a2, ...)
{
  return [a1 hasPreparedForFolderSharing];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hostingViewController(void *a1, const char *a2, ...)
{
  return [a1 hostingViewController];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return [a1 indexPathForSelectedRow];
}

id objc_msgSend_infoLabel(void *a1, const char *a2, ...)
{
  return [a1 infoLabel];
}

id objc_msgSend_infoTextLabel(void *a1, const char *a2, ...)
{
  return [a1 infoTextLabel];
}

id objc_msgSend_infoView(void *a1, const char *a2, ...)
{
  return [a1 infoView];
}

id objc_msgSend_initCommon(void *a1, const char *a2, ...)
{
  return [a1 initCommon];
}

id objc_msgSend_initialSharing(void *a1, const char *a2, ...)
{
  return [a1 initialSharing];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 isCurrentUser];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFolderShare(void *a1, const char *a2, ...)
{
  return [a1 isFolderShare];
}

id objc_msgSend_isGroup(void *a1, const char *a2, ...)
{
  return [a1 isGroup];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return [a1 isNetworkReachable];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return [a1 isOn];
}

id objc_msgSend_isPartOfCloudKitSharedFolder(void *a1, const char *a2, ...)
{
  return [a1 isPartOfCloudKitSharedFolder];
}

id objc_msgSend_isPreparingForFolderSharing(void *a1, const char *a2, ...)
{
  return [a1 isPreparingForFolderSharing];
}

id objc_msgSend_isShowAddPeople(void *a1, const char *a2, ...)
{
  return [a1 isShowAddPeople];
}

id objc_msgSend_isShowingSpinner(void *a1, const char *a2, ...)
{
  return [a1 isShowingSpinner];
}

id objc_msgSend_itemIsInsideFolderShare(void *a1, const char *a2, ...)
{
  return [a1 itemIsInsideFolderShare];
}

id objc_msgSend_itemIsShareRoot(void *a1, const char *a2, ...)
{
  return [a1 itemIsShareRoot];
}

id objc_msgSend_itemName(void *a1, const char *a2, ...)
{
  return [a1 itemName];
}

id objc_msgSend_itemTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 itemTitleLabel];
}

id objc_msgSend_itemURL(void *a1, const char *a2, ...)
{
  return [a1 itemURL];
}

id objc_msgSend_itemUTI(void *a1, const char *a2, ...)
{
  return [a1 itemUTI];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leading(void *a1, const char *a2, ...)
{
  return [a1 leading];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 leftBarButtonItem];
}

id objc_msgSend_leftBarButtonItems(void *a1, const char *a2, ...)
{
  return [a1 leftBarButtonItems];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadingLabel(void *a1, const char *a2, ...)
{
  return [a1 loadingLabel];
}

id objc_msgSend_loadingView(void *a1, const char *a2, ...)
{
  return [a1 loadingView];
}

id objc_msgSend_localizedAdditionalDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedAdditionalDescription];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedUppercaseString];
}

id objc_msgSend_lookupInfo(void *a1, const char *a2, ...)
{
  return [a1 lookupInfo];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mailComposeViewController(void *a1, const char *a2, ...)
{
  return [a1 mailComposeViewController];
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return [a1 main];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 makeKeyWindow];
}

id objc_msgSend_messageComposeViewController(void *a1, const char *a2, ...)
{
  return [a1 messageComposeViewController];
}

id objc_msgSend_modalPresentationStyle(void *a1, const char *a2, ...)
{
  return [a1 modalPresentationStyle];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_modelSnapshot(void *a1, const char *a2, ...)
{
  return [a1 modelSnapshot];
}

id objc_msgSend_monogrammer(void *a1, const char *a2, ...)
{
  return [a1 monogrammer];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return [a1 nameComponents];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
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

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return [a1 operationQueue];
}

id objc_msgSend_originalShare(void *a1, const char *a2, ...)
{
  return [a1 originalShare];
}

id objc_msgSend_overviewControllerDelegate(void *a1, const char *a2, ...)
{
  return [a1 overviewControllerDelegate];
}

id objc_msgSend_owner(void *a1, const char *a2, ...)
{
  return [a1 owner];
}

id objc_msgSend_ownerLabel(void *a1, const char *a2, ...)
{
  return [a1 ownerLabel];
}

id objc_msgSend_ownerNameComponents(void *a1, const char *a2, ...)
{
  return [a1 ownerNameComponents];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_participant(void *a1, const char *a2, ...)
{
  return [a1 participant];
}

id objc_msgSend_participantArrayController(void *a1, const char *a2, ...)
{
  return [a1 participantArrayController];
}

id objc_msgSend_participantColor(void *a1, const char *a2, ...)
{
  return [a1 participantColor];
}

id objc_msgSend_participantID(void *a1, const char *a2, ...)
{
  return [a1 participantID];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_permission(void *a1, const char *a2, ...)
{
  return [a1 permission];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_popoverPresentationMode(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationMode];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return [a1 presentationController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingError(void *a1, const char *a2, ...)
{
  return [a1 presentingError];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressLabel(void *a1, const char *a2, ...)
{
  return [a1 progressLabel];
}

id objc_msgSend_proxiedOverviewController(void *a1, const char *a2, ...)
{
  return [a1 proxiedOverviewController];
}

id objc_msgSend_publicPermission(void *a1, const char *a2, ...)
{
  return [a1 publicPermission];
}

id objc_msgSend_reachabilityMonitor(void *a1, const char *a2, ...)
{
  return [a1 reachabilityMonitor];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return [a1 recipients];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return [a1 recordName];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rootItemName(void *a1, const char *a2, ...)
{
  return [a1 rootItemName];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return [a1 searchController];
}

id objc_msgSend_searchManager(void *a1, const char *a2, ...)
{
  return [a1 searchManager];
}

id objc_msgSend_searchResultTable(void *a1, const char *a2, ...)
{
  return [a1 searchResultTable];
}

id objc_msgSend_searchResultTableViewController(void *a1, const char *a2, ...)
{
  return [a1 searchResultTableViewController];
}

id objc_msgSend_searchResults(void *a1, const char *a2, ...)
{
  return [a1 searchResults];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemBackgroundColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return [a1 sections];
}

id objc_msgSend_sendButton(void *a1, const char *a2, ...)
{
  return [a1 sendButton];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return [a1 separatorColor];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_setupActivityDelegate(void *a1, const char *a2, ...)
{
  return [a1 setupActivityDelegate];
}

id objc_msgSend_share(void *a1, const char *a2, ...)
{
  return [a1 share];
}

id objc_msgSend_shareCreationSema(void *a1, const char *a2, ...)
{
  return [a1 shareCreationSema];
}

id objc_msgSend_shareDidChange(void *a1, const char *a2, ...)
{
  return [a1 shareDidChange];
}

id objc_msgSend_shareRootItemURL(void *a1, const char *a2, ...)
{
  return [a1 shareRootItemURL];
}

id objc_msgSend_shareURL(void *a1, const char *a2, ...)
{
  return [a1 shareURL];
}

id objc_msgSend_shareURLUnreachable(void *a1, const char *a2, ...)
{
  return [a1 shareURLUnreachable];
}

id objc_msgSend_shareViewControllerAllowOthersToInvite(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerAllowOthersToInvite];
}

id objc_msgSend_shareViewControllerCurrentParticipantsState(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerCurrentParticipantsState];
}

id objc_msgSend_shareViewControllerDidActivateShowSharedFolder(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerDidActivateShowSharedFolder];
}

id objc_msgSend_shareViewControllerHeaderPrimaryImage(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerHeaderPrimaryImage];
}

id objc_msgSend_shareViewControllerHeaderSecondaryImage(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerHeaderSecondaryImage];
}

id objc_msgSend_shareViewControllerIsNotesOrRemindersOrDocSharing(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerIsNotesOrRemindersOrDocSharing];
}

id objc_msgSend_shareViewControllerParticipantDetails(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerParticipantDetails];
}

id objc_msgSend_shareViewControllerPrimaryAuxilarySwitchTitle(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerPrimaryAuxilarySwitchTitle];
}

id objc_msgSend_shareViewControllerPrimaryAuxiliarySwitchState(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerPrimaryAuxiliarySwitchState];
}

id objc_msgSend_shareViewControllerSecondaryAuxilarySwitchTitle(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerSecondaryAuxilarySwitchTitle];
}

id objc_msgSend_shareViewControllerSecondaryAuxiliarySwitchState(void *a1, const char *a2, ...)
{
  return [a1 shareViewControllerSecondaryAuxiliarySwitchState];
}

id objc_msgSend_sharedByModifiedByLabel(void *a1, const char *a2, ...)
{
  return [a1 sharedByModifiedByLabel];
}

id objc_msgSend_sharedByModifiedByText(void *a1, const char *a2, ...)
{
  return [a1 sharedByModifiedByText];
}

id objc_msgSend_sharedCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 sharedCloudDatabase];
}

id objc_msgSend_sharedGenerator(void *a1, const char *a2, ...)
{
  return [a1 sharedGenerator];
}

id objc_msgSend_sharedItemBadge(void *a1, const char *a2, ...)
{
  return [a1 sharedItemBadge];
}

id objc_msgSend_sharedItemLabel(void *a1, const char *a2, ...)
{
  return [a1 sharedItemLabel];
}

id objc_msgSend_sharedItemThumnail(void *a1, const char *a2, ...)
{
  return [a1 sharedItemThumnail];
}

id objc_msgSend_sharedMenuController(void *a1, const char *a2, ...)
{
  return [a1 sharedMenuController];
}

id objc_msgSend_sharedReachabilityMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedReachabilityMonitor];
}

id objc_msgSend_sharedWithinLabel(void *a1, const char *a2, ...)
{
  return [a1 sharedWithinLabel];
}

id objc_msgSend_sharingAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sharingAppBundleIdentifier];
}

id objc_msgSend_sharingAppBundleIdentifierOverride(void *a1, const char *a2, ...)
{
  return [a1 sharingAppBundleIdentifierOverride];
}

id objc_msgSend_sharingAppName(void *a1, const char *a2, ...)
{
  return [a1 sharingAppName];
}

id objc_msgSend_shouldHideCopyLink(void *a1, const char *a2, ...)
{
  return [a1 shouldHideCopyLink];
}

id objc_msgSend_shouldShowAllowInviting(void *a1, const char *a2, ...)
{
  return [a1 shouldShowAllowInviting];
}

id objc_msgSend_shouldShowMode(void *a1, const char *a2, ...)
{
  return [a1 shouldShowMode];
}

id objc_msgSend_shouldShowPermissions(void *a1, const char *a2, ...)
{
  return [a1 shouldShowPermissions];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sourceApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceApplicationBundleIdentifier];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startReceiver(void *a1, const char *a2, ...)
{
  return [a1 startReceiver];
}

id objc_msgSend_staticTableDataSource(void *a1, const char *a2, ...)
{
  return [a1 staticTableDataSource];
}

id objc_msgSend_staticTableView(void *a1, const char *a2, ...)
{
  return [a1 staticTableView];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return [a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemGroupedBackgroundColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textStorage(void *a1, const char *a2, ...)
{
  return [a1 textStorage];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return [a1 textView];
}

id objc_msgSend_thumbnailView(void *a1, const char *a2, ...)
{
  return [a1 thumbnailView];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_top(void *a1, const char *a2, ...)
{
  return [a1 top];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_translatesAutoresizingMaskIntoConstraints(void *a1, const char *a2, ...)
{
  return [a1 translatesAutoresizingMaskIntoConstraints];
}

id objc_msgSend_transportRegion(void *a1, const char *a2, ...)
{
  return [a1 transportRegion];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uncommentedAddresses(void *a1, const char *a2, ...)
{
  return [a1 uncommentedAddresses];
}

id objc_msgSend_unreachableViewController(void *a1, const char *a2, ...)
{
  return [a1 unreachableViewController];
}

id objc_msgSend_updateFolderSharingHeader(void *a1, const char *a2, ...)
{
  return [a1 updateFolderSharingHeader];
}

id objc_msgSend_updateOtherRecipients(void *a1, const char *a2, ...)
{
  return [a1 updateOtherRecipients];
}

id objc_msgSend_updatePermissionOptions(void *a1, const char *a2, ...)
{
  return [a1 updatePermissionOptions];
}

id objc_msgSend_updateSections(void *a1, const char *a2, ...)
{
  return [a1 updateSections];
}

id objc_msgSend_updateTemplateStrings(void *a1, const char *a2, ...)
{
  return [a1 updateTemplateStrings];
}

id objc_msgSend_updateThumbnail(void *a1, const char *a2, ...)
{
  return [a1 updateThumbnail];
}

id objc_msgSend_updateTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 updateTraitCollection];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_useFileProviderFramework(void *a1, const char *a2, ...)
{
  return [a1 useFileProviderFramework];
}

id objc_msgSend_userIdentity(void *a1, const char *a2, ...)
{
  return [a1 userIdentity];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userRecordID(void *a1, const char *a2, ...)
{
  return [a1 userRecordID];
}

id objc_msgSend_vContainer(void *a1, const char *a2, ...)
{
  return [a1 vContainer];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_vcForActivityPresentation(void *a1, const char *a2, ...)
{
  return [a1 vcForActivityPresentation];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 verticalSizeClass];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_workerQueue(void *a1, const char *a2, ...)
{
  return [a1 workerQueue];
}