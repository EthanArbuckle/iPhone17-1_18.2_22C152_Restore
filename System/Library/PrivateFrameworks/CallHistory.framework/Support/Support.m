void sub_100002E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002EB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained prune];
    id WeakRetained = v2;
  }
}

void sub_100002F68(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pruning call history database", v5, 2u);
  }

  v4 = (void *)os_transaction_create();
  [*(id *)(a1 + 32) pruneSync];
}

void sub_1000039E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000039F8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

void sub_100003A84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(unsigned char *)(v1 + 8) = v2;
    v4 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 40)) {
        v5 = "active";
      }
      else {
        v5 = "not active";
      }
      int v6 = 136446210;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "iCloud account is now %{public}s", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100003F2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) logHandle];
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002D63C();
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Retrieved iCloud account information %{public}@", buf, 0xCu);
  }

  v9 = (char *)[v5 accountStatus];
  if ((unint64_t)(v9 - 2) < 3)
  {
    v10 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CKStringFromAccountStatus();
      *(_DWORD *)buf = 138543362;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "iCloud sync will be disabled; account status is %{public}@",
        buf,
        0xCu);
    }
LABEL_7:

LABEL_15:
    v15 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Disabling iCloud sync", buf, 2u);
    }

    [*(id *)(a1 + 32) setAccountActive:0];
    v8 = [*(id *)(a1 + 32) containerUserDefaults];
    [v8 setTransactionRecordZoneFetchDate:0];
LABEL_18:

    v16 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Disabling iCloud sync.", buf, 2u);
    }

    [*(id *)(a1 + 32) setAccountActive:0];
    v17 = [*(id *)(a1 + 32) containerUserDefaults];
    [v17 setTransactionRecordZoneFetchDate:0];
    goto LABEL_21;
  }
  if (v9 != (char *)1)
  {
    if (!v9)
    {
      v12 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not determine iCloud account status; scheduling retry.",
          buf,
          2u);
      }

      v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(unsigned int *)(a1 + 40);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100004360;
      v24[3] = &unk_100048C40;
      v24[4] = v13;
      id v25 = v6;
      int v26 = *(_DWORD *)(a1 + 40);
      [v13 retryCloudKitOperationForError:v25 withRetryCount:v14 withCallback:v24];
    }
    goto LABEL_15;
  }
  unsigned __int8 v18 = [v5 supportsDeviceToDeviceEncryption];
  v19 = *(void **)(a1 + 32);
  if ((v18 & 1) == 0)
  {
    v10 = [v19 logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "iCloud sync will be disabled; device to device encryption is not enabled.",
        buf,
        2u);
    }
    goto LABEL_7;
  }
  unsigned int v20 = [v19 isAccountActive];
  v21 = *(void **)(a1 + 32);
  if (!v20)
  {
    [v21 setAccountActive:1];
    v22 = *(void **)(a1 + 32);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000445C;
    v23[3] = &unk_100048C68;
    v23[4] = v22;
    [v22 fetchTransactionRecordZoneWithCompletion:v23];
    goto LABEL_22;
  }
  v17 = [v21 logHandle];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Account is currently active", buf, 2u);
  }
LABEL_21:

LABEL_22:
}

id sub_100004360(uint64_t a1, int a2)
{
  v4 = [*(id *)(a1 + 32) logHandle];
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Account query failed with error %{public}@, will retry", (uint8_t *)&v8, 0xCu);
    }

    return [*(id *)(a1 + 32) queryAccountStatusWithRetryCount:(*(_DWORD *)(a1 + 48) + 1)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002D6A4();
    }

    return [*(id *)(a1 + 32) setAccountActive:0];
  }
}

id sub_10000445C(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 setupSubscription];
    v4 = *(void **)(a1 + 32);
    return _[v4 performInitialSyncIfNeeded];
  }
  else
  {
    id v5 = [v3 logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Could not fetch record zone; disabling syncing and setting account active to NO",
        v7,
        2u);
    }

    return [*(id *)(a1 + 32) setAccountActive:0];
  }
}

void sub_1000046B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    int v8 = +[NSDate date];
    uint64_t v9 = [*(id *)(a1 + 32) containerUserDefaults];
    [v9 setTransactionRecordZoneCreationDate:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v6)
  {
    uint64_t v10 = (*(_DWORD *)(a1 + 48) + 1);
    v11 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000047F0;
    v12[3] = &unk_100048CB8;
    v12[4] = v11;
    int v15 = v10;
    id v14 = *(id *)(a1 + 40);
    id v13 = v7;
    [v11 retryCloudKitOperationForError:v13 withRetryCount:v10 withCallback:v12];
  }
}

id sub_1000047F0(uint64_t a1, int a2)
{
  if (a2) {
    return _[*(id *)(a1 + 32) createRecordZoneWithAttemptCount:*(unsigned int *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else {
    return (id)(*(uint64_t (**)(void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, *(void *)(a1 + 40));
  }
}

void sub_100004B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004BB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004BC0(uint64_t a1)
{
}

void sub_100004BC8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    v11 = [v9 domain];
    v12 = v11;
    if (v11 == CKErrorDomain)
    {
      id v13 = [v10 code];

      if (v13 == (id)2)
      {
        id v14 = [*(id *)(a1 + 32) logHandle];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10002D710(v10, v14);
        }

        goto LABEL_14;
      }
    }
    else
    {
    }
    int v15 = [v10 domain];
    if (v15 != CKErrorDomain)
    {

      goto LABEL_19;
    }
    id v16 = [v10 code];

    if (v16 != (id)21)
    {
LABEL_19:
      v27 = [v10 domain];
      if (v27 == CKErrorDomain)
      {
        id v28 = [v10 code];

        if (v28 == (id)26)
        {
          v29 = [*(id *)(a1 + 32) logHandle];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = [*(id *)(a1 + 32) transactionRecordZone];
            v31 = [v30 zoneID];
            v32 = [v31 zoneName];
            *(_DWORD *)buf = 138543362;
            id v48 = v32;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ zone does not exist, creating it", buf, 0xCu);
          }
          uint64_t v33 = *(void **)(a1 + 32);
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_10000504C;
          v44[3] = &unk_100048D08;
          uint64_t v34 = *(void *)(a1 + 64);
          v44[4] = v33;
          uint64_t v46 = v34;
          id v45 = *(id *)(a1 + 40);
          [v33 createRecordZoneWithCompletionHandler:v44];
          v35 = v45;
          goto LABEL_26;
        }
      }
      else
      {
      }
      uint64_t v36 = (*(_DWORD *)(a1 + 72) + 1);
      v37 = *(void **)(a1 + 32);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000050C4;
      v39[3] = &unk_100048D30;
      int v43 = v36;
      uint64_t v38 = *(void *)(a1 + 64);
      v39[4] = v37;
      uint64_t v42 = v38;
      id v41 = *(id *)(a1 + 40);
      id v40 = v10;
      [v37 retryCloudKitOperationForError:v40 withRetryCount:v36 withCallback:v39];

      v35 = v41;
LABEL_26:

      goto LABEL_27;
    }
    v17 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CloudKit said our change token has expired!", buf, 2u);
    }

    [*(id *)(a1 + 32) setPreviousServerChangeToken:0];
  }
LABEL_14:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v19 = [WeakRetained moreComing];

  id v20 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v20 encodeObject:v7 forKey:NSKeyedArchiveRootObjectKey];
  v21 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    v23 = "no";
    if (v19) {
      v23 = "yes";
    }
    *(_DWORD *)buf = 134218242;
    id v48 = v22;
    __int16 v49 = 2082;
    v50 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Got %lu cloud transactions with more coming (%{public}s)", buf, 0x16u);
  }

  uint64_t v24 = *(void *)(a1 + 40);
  uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  int v26 = [v20 encodedData];
  (*(void (**)(uint64_t, uint64_t, id, void *, void))(v24 + 16))(v24, v25, v19, v26, 0);

LABEL_27:
}

void sub_10000504C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)a1[4];
  if (a2)
  {
    [v6 getUpdatesWithQualityOfService:a1[6] withCallback:a1[5]];
  }
  else
  {
    id v7 = [v6 logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002D7C0();
    }
  }
}

id sub_1000050C4(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return _[v3 getUpdatesWithRetryCount:v4 withQualityOfService:v5 withCallback:v6];
  }
  else
  {
    id v7 = [v3 logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002D828(a1, v7);
    }

    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100005158(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  unsigned __int8 v5 = [v4 isEqualToString:@"Transaction"];

  if (v5)
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"syncOperationIdentifier"];
    id v7 = [*(id *)(a1 + 32) operationIdentifier];
    unsigned int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) logHandle];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v10 = [v3 recordID];
      v11 = [v10 recordName];
      *(_DWORD *)buf = 138543362;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring Record %{public}@ since the source was this device", buf, 0xCu);

LABEL_23:
      goto LABEL_24;
    }
    id v9 = [v3 objectForKeyedSubscript:@"type"];
    if (![v9 length])
    {
      uint64_t v10 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002D8D4(v3, v10);
      }
      goto LABEL_23;
    }
    v12 = [v3 encryptedValuesByKey];
    uint64_t v10 = [v12 objectForKeyedSubscript:@"encryptedData"];

    if (![v10 length])
    {
      id v13 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10002D96C(v3, v13);
      }
      goto LABEL_22;
    }
    id v13 = [[CHRecentCallPb alloc] initWithData:v10];
    id v14 = [v13 chRecentCall];
    int v15 = v14;
    if (!v14)
    {
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    id v20 = 0;
    id v16 = [v14 archivedDataWithError:&v20];
    id v17 = v20;
    unsigned __int8 v18 = v17;
    if (v16)
    {
      id v19 = [objc_alloc((Class)CHTransaction) initWithString:v9 andRecord:v16];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v19];
    }
    else
    {
      if (!v17)
      {
LABEL_20:

        goto LABEL_21;
      }
      id v19 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10002DA04();
      }
    }

    goto LABEL_20;
  }
  uint64_t v6 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v3 recordID];
    uint64_t v10 = [v3 recordType];
    *(_DWORD *)buf = 138543618;
    id v22 = v9;
    __int16 v23 = 2114;
    uint64_t v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring record %{public}@ with type %{public}@", buf, 0x16u);
    goto LABEL_23;
  }
LABEL_25:
}

void sub_1000054B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v5 = [v3 recordName];
    *(_DWORD *)buf = 138543362;
    int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Record %{public}@ was deleted", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)CHRecentCall);
  id v7 = [v3 recordName];
  [v6 setUniqueId:v7];

  id v13 = 0;
  unsigned int v8 = [v6 archivedDataWithError:&v13];
  id v9 = v13;
  if (v8)
  {
    id v10 = objc_alloc((Class)CHTransaction);
    v11 = +[CHTransaction toString:2];
    v12 = [v10 initWithString:v11 andRecord:v8];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v12];
  }
  else
  {
    v12 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002DA6C((uint64_t)v6);
    }
  }
}

void sub_100005C60(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100005C94(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 recordID];
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Record %{public}@ progress %f", (uint8_t *)&v8, 0x16u);
  }
}

void sub_100005D7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    __int16 v10 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [v5 recordID];
      v12 = [v11 recordName];
      int v20 = 138543362;
      v21 = v12;
      id v13 = "Saved record %{public}@";
      goto LABEL_8;
    }
LABEL_22:

    goto LABEL_23;
  }
  int v8 = [v6 domain];
  unsigned int v9 = [v8 isEqualToString:CKErrorDomain];

  if (!v9)
  {
LABEL_19:
    __int16 v10 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [v5 recordID];
      v12 = [v11 recordName];
      int v20 = 138543618;
      v21 = v12;
      __int16 v22 = 2114;
      __int16 v23 = v7;
      id v13 = "Could not save record %{public}@: %{public}@";
      id v14 = v10;
      uint32_t v15 = 22;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if ([v7 code] == (id)14)
  {
    __int16 v10 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [v5 recordID];
      v12 = [v11 recordName];
      int v20 = 138543362;
      v21 = v12;
      id v13 = "Server said record %{public}@ already exists";
LABEL_8:
      id v14 = v10;
      uint32_t v15 = 12;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, v15);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if ([v7 code] != (id)26)
  {
    if ([v7 code] == (id)7)
    {
      __int16 v10 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = [v5 recordID];
        v12 = [v11 recordName];
        int v20 = 138543362;
        v21 = v12;
        id v13 = "Could not save record %{public}@ due to rate limiting";
        goto LABEL_8;
      }
      goto LABEL_22;
    }
    if ([v7 code] == (id)22)
    {
      __int16 v10 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = [v5 recordID];
        v12 = [v11 recordName];
        int v20 = 138543362;
        v21 = v12;
        id v13 = "Could not save record %{public}@ due to an overall batch failure";
        goto LABEL_8;
      }
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  id v16 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [*(id *)(a1 + 32) transactionRecordZone];
    unsigned __int8 v18 = [v17 zoneID];
    id v19 = [v18 zoneName];
    int v20 = 138543362;
    v21 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ zone does not exist, will create it", (uint8_t *)&v20, 0xCu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_23:
}

void sub_100006114(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = v9;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    double v11 = *(void **)(a1 + 32);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100006438;
    v26[3] = &unk_100048E20;
    v26[4] = v11;
    id v27 = *(id *)(a1 + 40);
    id v28 = *(id *)(a1 + 48);
    int v30 = *(_DWORD *)(a1 + 72);
    id v29 = *(id *)(a1 + 56);
    [v11 createRecordZoneWithCompletionHandler:v26];

    v12 = v27;
LABEL_8:

    goto LABEL_9;
  }
  if (v9)
  {
    id v13 = [v9 domain];
    unsigned int v14 = [v13 isEqualToString:CKErrorDomain];

    if (!v14 || [v10 code] != (id)2)
    {
      uint64_t v15 = (*(_DWORD *)(a1 + 72) + 1);
      id v16 = *(void **)(a1 + 32);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000064B8;
      v20[3] = &unk_100048E48;
      v20[4] = v16;
      id v21 = *(id *)(a1 + 40);
      id v22 = *(id *)(a1 + 48);
      int v25 = v15;
      id v24 = *(id *)(a1 + 56);
      id v23 = v10;
      [v16 retryCloudKitOperationForError:v23 withRetryCount:v15 withCallback:v20];

      v12 = v21;
      goto LABEL_8;
    }
    [*(id *)(a1 + 32) handlePartialUploadFailure:v10 withUploadRecordsToSave:*(void *)(a1 + 40) withRecordsToDelete:*(void *)(a1 + 48) withRetryCount:*(unsigned int *)(a1 + 72) withCallback:*(void *)(a1 + 56)];
  }
  else
  {
    id v17 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v32 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Saved %lu records", buf, 0xCu);
    }

    unsigned __int8 v18 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v8 count];
      *(_DWORD *)buf = 134217984;
      id v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Deleted %lu records", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
LABEL_9:
}

void sub_100006438(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (a2)
  {
    [v6 uploadRecordsToSave:*(void *)(a1 + 40) withRecordsToDelete:*(void *)(a1 + 48) withRetryCount:*(unsigned int *)(a1 + 64) withCallback:*(void *)(a1 + 56)];
  }
  else
  {
    id v7 = [v6 logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002D7C0();
    }
  }
}

id sub_1000064B8(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(unsigned int *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 64);
    return [v3 uploadRecordsToSave:v4 withRecordsToDelete:v5 withRetryCount:v6 withCallback:v7];
  }
  else
  {
    id v9 = [v3 logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002DADC(a1, v9, v10, v11, v12, v13, v14, v15);
    }

    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

id sub_100006C68(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(unsigned int *)(a1 + 80);
    uint64_t v7 = *(void *)(a1 + 72);
    return [v3 uploadRecordsToSave:v4 withRecordsToDelete:v5 withRetryCount:v6 withCallback:v7];
  }
  else
  {
    id v9 = [v3 logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002DB90(a1, v9, v10, v11, v12, v13, v14, v15);
    }

    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_1000080F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v8 = +[NSString stringWithFormat:@"Could not delete record zone %@: %@", a2, a3];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Zone deleted, attempting to create", buf, 2u);
    }

    uint64_t v5 = [*(id *)(a1 + 32) database];
    uint64_t v6 = [*(id *)(a1 + 32) transactionRecordZone];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008260;
    v9[3] = &unk_100048EC0;
    id v7 = *(id *)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    [v5 saveRecordZone:v6 completionHandler:v9];
  }
}

void sub_100008260(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [v5 zoneID];
    id v8 = [v7 zoneName];
    +[NSString stringWithFormat:@"Could not save Record Zone %@: %@", v8, v6];
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 zoneID];
      uint64_t v11 = [v10 zoneName];
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully created CKRecordZone %{public}@", buf, 0xCu);
    }
    id v7 = [v5 zoneID];
    id v8 = [v7 zoneName];
    +[NSString stringWithFormat:@"Deleted and recreated Record Zone %@", v8, v13];
  uint64_t v12 = };

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000882C(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = +[NSDate date];
    id v7 = [a1[4] logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving Transactions record zone fetch date %{public}@", buf, 0xCu);
    }

    id v8 = [a1[4] containerUserDefaults];
    [v8 setTransactionRecordZoneFetchDate:v6];

    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_14;
  }
  id v9 = [a1[4] logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10002DEF8();
  }

  id v10 = [v5 domain];
  uint64_t v11 = v10;
  if (v10 != CKErrorDomain)
  {

LABEL_13:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_14;
  }
  id v12 = [v5 code];

  if (v12 != (id)26) {
    goto LABEL_13;
  }
  uint64_t v13 = [a1[4] logHandle];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = a1[5];
    *(_DWORD *)buf = 138543362;
    int v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Issuing request to create record zone with identifier %{public}@", buf, 0xCu);
  }

  id v15 = a1[4];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100008AA4;
  v16[3] = &unk_100048F10;
  v16[4] = v15;
  id v18 = a1[6];
  id v17 = a1[5];
  [v15 createRecordZoneWithCompletionHandler:v16];

LABEL_14:
}

void sub_100008AA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) logHandle];
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully created record zone %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) fetchTransactionRecordZoneWithCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002DF68();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100008D54(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (*(_DWORD *)(a1 + 40) + 1);
    id v8 = *(void **)(a1 + 32);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100008ED0;
    v13[3] = &unk_100048C40;
    v13[4] = v8;
    int v15 = v7;
    id v14 = v5;
    [v8 retryCloudKitOperationForError:v14 withRetryCount:v7 withCallback:v13];
  }
  else
  {
    int v9 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)(a1 + 32) transactionRecordZone];
      uint64_t v11 = [v10 zoneID];
      id v12 = [v11 zoneName];
      *(_DWORD *)buf = 138543362;
      id v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registered for push notifications from Record Zone %{public}@", buf, 0xCu);
    }
  }
}

void sub_100008ED0(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 48);
    [v3 setupSubscriptionWithRetryCount:v4];
  }
  else
  {
    id v5 = [v3 logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002DFD8();
    }
  }
}

uint64_t sub_100009378(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000097D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000097F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000980C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100009838(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100009874(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10000B21C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

CFStringRef sub_10000B250(unsigned int a1)
{
  if (a1 > 4) {
    return @"???";
  }
  else {
    return *(&off_100048F80 + (char)a1);
  }
}

uint64_t sub_10000B564(void *a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      id v12 = objc_alloc_init(CHRecentCallPb);
      [a1 addCalls:v12];
      if (!PBReaderPlaceMark() || (sub_100022D40((uint64_t)v12, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

int64_t sub_10000C15C(id a1, CHTransaction *a2, CHTransaction *a3)
{
  char v4 = a2;
  unsigned int v5 = a3;
  id v6 = [(CHTransaction *)v4 transactionType];
  if (v6 == [(CHTransaction *)v5 transactionType])
  {
    int64_t v7 = 0;
    goto LABEL_10;
  }
  if (![(CHTransaction *)v4 transactionType])
  {
LABEL_7:
    int64_t v7 = -1;
    goto LABEL_10;
  }
  if (![(CHTransaction *)v5 transactionType]
    || [(CHTransaction *)v4 transactionType] == (id)3)
  {
    goto LABEL_9;
  }
  if ([(CHTransaction *)v5 transactionType] == (id)3) {
    goto LABEL_7;
  }
  if ([(CHTransaction *)v4 transactionType] == (id)2)
  {
LABEL_9:
    int64_t v7 = 1;
    goto LABEL_10;
  }
  if ([(CHTransaction *)v5 transactionType] == (id)2) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = 0;
  }
LABEL_10:

  return v7;
}

CFStringRef sub_10000DEB0(unsigned int a1)
{
  if (a1 > 2) {
    return @"Undefined";
  }
  else {
    return off_100048FE8[(char)a1];
  }
}

void sub_10000E0FC(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: task took longer than %f seconds", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16));
}

id sub_10000E70C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "begin_sync:", *(void *)(a1 + 40));
}

void sub_10000E8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E8C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E8D0(uint64_t a1)
{
}

void sub_10000E8D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000EA6C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"Could not upload new records to iCloud: %@", a2];
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v3;

    id v6 = *(void **)(a1 + 32);
    return objc_msgSend(v6, "handleOperationComplete_sync");
  }
  else
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "readTransactionsProcessed:", objc_msgSend(*(id *)(a1 + 40), "count"));
    uint64_t v8 = *(void **)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000EB64;
    v9[3] = &unk_100048BC8;
    v9[4] = v8;
    return [v8 execute:v9];
  }
}

id sub_10000EB64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "uploadChanges_sync");
}

void sub_10000EC00(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "checkAndSetOperationInProgress_sync:", *(void *)(a1 + 40)) & 1) == 0)
  {
    int v2 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Fetching changes from iCloud...", buf, 2u);
    }

    *(void *)buf = 0;
    uint64_t v13 = buf;
    uint64_t v14 = 0x3032000000;
    int v15 = sub_10000E8C0;
    id v16 = sub_10000E8D0;
    id v17 = (id)os_transaction_create();
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    uint64_t v8 = sub_10000ED7C;
    uint64_t v9 = &unk_100049060;
    uint64_t v11 = buf;
    id v10 = *(id *)(a1 + 40);
    uint64_t v3 = objc_retainBlock(&v6);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v3;

    objc_msgSend(*(id *)(a1 + 32), "downloadChanges_sync", v6, v7, v8, v9);
    _Block_object_dispose(buf, 8);
  }
}

void sub_10000ED64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000ED7C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EEAC(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v18 = a2;
  id v9 = a4;
  if (a5)
  {
    uint64_t v10 = +[NSString stringWithFormat:@"Could not fetch changes from iCloud: %@", a5];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 96);
    *(void *)(v11 + 96) = v10;

LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "handleOperationComplete_sync");
    goto LABEL_6;
  }
  if (![v18 count])
  {
    id v17 = [*(id *)(*(void *)(a1 + 32) + 8) containerUserDefaults];
    [v17 setPreviousServerChangeTokenData:v9];

    goto LABEL_3;
  }
  uint64_t v13 = objc_opt_new();
  [v13 setObject:v18 forKeyedSubscript:@"kCHRemoteTransactionsKey"];
  [v13 setObject:v9 forKeyedSubscript:@"kCHChangeTokenKey"];
  id v14 = [objc_alloc((Class)NSNumber) initWithBool:a3];
  [v13 setObject:v14 forKeyedSubscript:@"kCHMoreTransactionsComingKey"];

  id v15 = [objc_alloc((Class)NSNumber) initWithInt:1];
  [v13 setObject:v15 forKeyedSubscript:@"kCHSyncSourceKey"];

  id v16 = +[NSNotificationCenter defaultCenter];
  [v16 postNotificationName:@"kCallHistoryMergeRemoteTransactionsNotification" object:0 userInfo:v13];

LABEL_6:
}

id sub_10000F42C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleRemoteTransactionsApplied_sync:", *(void *)(a1 + 40));
}

void sub_10000FDE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_10000FE24()
{
}

void sub_10000FE2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained begin:&stru_100049118];
}

void sub_10000FE74(id a1, unsigned __int8 a2, NSString *a3)
{
  unsigned int v3 = a2;
  uint64_t v4 = a3;
  int v5 = +[CHLogServer sharedInstance];
  id v6 = [v5 logHandleForDomain:"SyncEngine"];

  uint64_t v7 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_10000B250(v3);
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Auto sync result (%{public}@) message (%{public}@)", (uint8_t *)&v9, 0x16u);
  }
}

void sub_10000FF78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained downloadChanges:&stru_100049138];
}

void sub_10000FFC0(id a1, unsigned __int8 a2, NSString *a3)
{
  unsigned int v3 = a2;
  uint64_t v4 = a3;
  int v5 = +[CHLogServer sharedInstance];
  id v6 = [v5 logHandleForDomain:"SyncEngine"];

  uint64_t v7 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_10000B250(v3);
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetch changes result (%{public}@) message (%{public}@)", (uint8_t *)&v9, 0x16u);
  }
}

void sub_1000100C4(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleRemoteTransactionsApplied:v3];
}

void sub_1000105B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000105D4(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained removeCalls];
  }
  else
  {
    if (state) {
      goto LABEL_6;
    }
    id WeakRetained = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(WeakRetained, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    xpc_dictionary_set_BOOL(WeakRetained, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_int64(WeakRetained, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
    xpc_dictionary_set_int64(WeakRetained, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_DAY);
    xpc_activity_set_criteria(activity, WeakRetained);
  }

LABEL_6:
}

void sub_100010AE4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received TERM signal, exiting", v2, 2u);
  }

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100049210);
}

void sub_100010B64(id a1)
{
}

CFStringRef CHCallerIdAvailabilityAsString(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return (const __CFString *)*((void *)&off_1000493D0 + (int)a1);
  }
}

CFDateRef sub_100010BEC(void *a1)
{
  id v1 = a1;
  int v2 = +[CHLogServer sharedInstance];
  id v3 = [v2 logHandleForDomain:"PowerUtilities"];

  uint64_t v4 = v3;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = [v1 intValue];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling wakeup in %d seconds", (uint8_t *)v10, 8u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v6 = CFDateCreate(0, Current + (double)(int)[v1 intValue]);
  if (CPScheduleWakeAtDateWithIdentifier())
  {
    uint64_t v7 = +[CHLogServer sharedInstance];
    uint64_t v8 = [v7 logHandleForDomain:"PowerUtilities"];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002EA5C(v8);
    }
  }
  else
  {
    CFRelease(v6);
    CFDateRef v6 = 0;
  }

  return v6;
}

void sub_100010D7C(void *a1)
{
  id v1 = a1;
  int v2 = +[CHLogServer sharedInstance];
  id v3 = [v2 logHandleForDomain:"PowerUtilities"];

  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v4)
    {
      int v5 = 138543362;
      id v6 = v1;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling scheduled wakeup at %{public}@", (uint8_t *)&v5, 0xCu);
    }

    CPCancelWakeAtDateWithIdentifier();
  }
  else
  {
    if (v4)
    {
      LOWORD(v5) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cannot cancel scheduled wakeup for invalid date!", (uint8_t *)&v5, 2u);
    }
  }
}

id sub_100011038(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel_sync");
}

id sub_1000112CC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleTransactionAdded_sync:withUpdate:orDelete:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
}

void sub_100011610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011634(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "fireSyncNotification_sync");
    id WeakRetained = v2;
  }
}

void sub_100011EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011F0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011F1C(uint64_t a1)
{
}

void sub_100011F24(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Returning next scheduled sync %@", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
}

uint64_t start()
{
  maybeLogVersionInfo();
  id v1 = objc_alloc_init(SignalHandler);
  id v2 = objc_alloc_init(SyncXPCServer);
  uint64_t v3 = +[NSRunLoop mainRunLoop];
  [v3 run];

  return 0;
}

void sub_100012508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001252C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = +[CHLogServer sharedInstance];
    uint64_t v7 = [v6 logHandleForDomain:"MergeTransactions"];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      CFStringRef v15 = @"kCallHistoryMergeRemoteTransactionsNotification";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got %{public}@ notification", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v8 = [v3 userInfo];
    int v9 = [v8 objectForKeyedSubscript:@"kCHSyncSourceKey"];

    uint64_t v10 = sub_100025E28(v9);
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = [v3 userInfo];
      [WeakRetained parseMergeDictionary:v12 withSyncSource:v11];
    }
    else
    {
      uint64_t v13 = +[CHLogServer sharedInstance];
      id v12 = [v13 logHandleForDomain:"MergeTransactions"];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543618;
        CFStringRef v15 = @"kCHSyncSourceKey";
        __int16 v16 = 2114;
        CFStringRef v17 = @"kCallHistoryMergeRemoteTransactionsNotification";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Expected valid %{public}@ key to be present in user info dictionary for %{public}@ notification", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

BOOL sub_100013318(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 record];
  id v6 = [v4 unarchiveCallObject:v5];

  if (v6)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000137B0;
    v29[3] = &unk_100049470;
    uint64_t v7 = *(void **)(a1 + 40);
    v29[4] = *(void *)(a1 + 32);
    v29[5] = v6;
    uint64_t v8 = v3;
    int v30 = v8;
    id v9 = [v7 indexOfObjectPassingTest:v29];
    uint64_t v10 = [*(id *)(a1 + 32) logHandle];
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (v11)
      {
        int v26 = +[CHTransaction toString:[v8 transactionType]];
        id v27 = [v6 uniqueId];
        *(_DWORD *)buf = 138543618;
        id v32 = v26;
        __int16 v33 = 2114;
        uint64_t v34 = v27;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Matched local %{public}@ transaction for %{public}@", buf, 0x16u);
      }
      BOOL v18 = 0;
      goto LABEL_25;
    }
    if (v11)
    {
      id v12 = [v6 uniqueId];
      *(_DWORD *)buf = 138543362;
      id v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Searching for call %{public}@ in local data store", buf, 0xCu);
    }
    uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 40);
    int v14 = [v6 uniqueId];
    uint64_t v10 = [v13 fetchObjectWithUniqueId:v14];

    if (!v10)
    {
      CFStringRef v15 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = [v6 uniqueId];
        *(_DWORD *)buf = 138543362;
        id v32 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Did not find call %{public}@ in data store, attempting to fingerprint", buf, 0xCu);
      }
      uint64_t v10 = +[CHCallFingerprint matchCallWithFingerprint:v6 usingDatabase:*(void *)(*(void *)(a1 + 32) + 40)];
      if (!v10)
      {
        BOOL v18 = 1;
        goto LABEL_26;
      }
    }
    id v17 = [v8 transactionType];
    BOOL v18 = v17 != 0;
    if (v17)
    {
      id v19 = [*(id *)(a1 + 32) logHandle];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:

LABEL_25:
LABEL_26:

        goto LABEL_27;
      }
      int v20 = +[CHTransaction toString:[v8 transactionType]];
      id v21 = [v6 uniqueId];
      *(_DWORD *)buf = 138543618;
      id v32 = v20;
      __int16 v33 = 2114;
      uint64_t v34 = v21;
      id v22 = "Keeping remote %{public}@ transaction for call record %{public}@";
      id v23 = v19;
      uint32_t v24 = 22;
    }
    else
    {
      id v19 = objc_msgSend(*(id *)(a1 + 32), "reconcileTransaction:withLocalCall:withRemoteCall:", -[NSObject transactionType](v8, "transactionType"), v10, v6);
      if (v19) {
        [*(id *)(a1 + 48) addObject:v19];
      }
      int v20 = [*(id *)(a1 + 32) logHandle];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      id v21 = [v6 uniqueId];
      *(_DWORD *)buf = 138543362;
      id v32 = v21;
      id v22 = "Dropping remote insert transaction for call record %{public}@";
      id v23 = v20;
      uint32_t v24 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);

LABEL_23:
    goto LABEL_24;
  }
  int v25 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v3;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Ignoring %@ because the call couldn't be unarchived", buf, 0xCu);
  }

  BOOL v18 = 0;
LABEL_27:

  return v18;
}

uint64_t sub_1000137B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 record];
  id v6 = [v4 unarchiveCallObject:v5];

  if (v6
    && +[CHCallFingerprint doesCall:matchWith:](CHCallFingerprint, "doesCall:matchWith:", *(void *)(a1 + 40), v6)&& (id v7 = [v3 transactionType], v7 == objc_msgSend(*(id *)(a1 + 48), "transactionType")))
  {
    id v8 = objc_msgSend(*(id *)(a1 + 32), "reconcileTransaction:withLocalCall:withRemoteCall:", objc_msgSend(*(id *)(a1 + 48), "transactionType"), v6, *(void *)(a1 + 40));
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_100013980(_Unwind_Exception *exception_object, int a2, ...)
{
  va_start(va, a2);
  if (a2)
  {
    if (a2 == 2)
    {
      id v4 = objc_begin_catch(exception_object);
      uint64_t v5 = [v2 logHandle];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = [v4 reason];
        id v7 = [v4 name];
        sub_10002EB3C(v6, v7, (uint8_t *)va, v5);
      }

      objc_end_catch();
      JUMPOUT(0x100013928);
    }
    objc_begin_catch(exception_object);
    id v8 = v3;
    objc_end_catch();
    JUMPOUT(0x100013930);
  }
  _Unwind_Resume(exception_object);
}

void sub_100013D6C(id a1)
{
  qword_100053E38 = (uint64_t)objc_alloc_init((Class)ACAccountStore);
  _objc_release_x1();
}

void sub_100014960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100015354(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_10000B250(a2);
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got sync result (%{public}@) message (%{public}@)", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100015720(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCloudKitActivation];
  id v2 = *(void **)(a1 + 32);
  return _[v2 updateDataStoreMaintenance];
}

void sub_100016174(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained connection];
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];
    [v4 _setEnabledTopics:v5];

    [v4 setDelegate:v3];
  }
}

void sub_1000172F0(id a1)
{
  id v1 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v4[0] = v1;
  v4[1] = CNContactPhoneNumbersKey;
  v4[2] = CNContactEmailAddressesKey;
  uint64_t v2 = +[NSArray arrayWithObjects:v4 count:3];
  id v3 = (void *)qword_100053E48;
  qword_100053E48 = v2;
}

void sub_1000173F8(id a1)
{
  qword_100053E58 = (uint64_t)objc_alloc_init((Class)CNContactStore);
  _objc_release_x1();
}

void sub_100017488(id a1)
{
  id v1 = [objc_alloc((Class)CSSearchableIndex) initWithName:@"com.apple.mobilephone" bundleIdentifier:@"com.apple.mobilephone"];
  id v2 = objc_alloc_init((Class)CHFeatureFlags);
  id v3 = [(id)objc_opt_class() contactStore];
  id v4 = objc_alloc_init((Class)TUCallDirectoryMetadataCacheDataProvider);
  v12[0] = v4;
  id v5 = objc_alloc_init((Class)TUMapsMetadataCacheDataProvider);
  v12[1] = v5;
  id v6 = objc_alloc_init((Class)TUSuggestionsMetadataCacheDataProvider);
  v12[2] = v6;
  id v7 = objc_alloc_init((Class)TUGeoLocationMetadataCacheDataProvider);
  v12[3] = v7;
  int v8 = +[NSArray arrayWithObjects:v12 count:4];

  id v9 = [objc_alloc((Class)TUMetadataCache) initWithDataProviders:v8];
  __int16 v10 = [[CHSpotlightIndexManager alloc] initWithIndex:v1 metadataCache:v9 contactStore:v3 featureFlags:v2];
  id v11 = (void *)qword_100053E68;
  qword_100053E68 = (uint64_t)v10;
}

id sub_100017894(uint64_t a1)
{
  return _[*(id *)(a1 + 32) indexTransactionsSync:*(void *)(a1 + 40)];
}

id sub_100017D70(uint64_t a1)
{
  return [*(id *)(a1 + 32) indexInsertedCallsSync:*(void *)(a1 + 40) completion:0];
}

id sub_100017E2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeDeletedCallsSync:*(void *)(a1 + 40)];
}

void sub_1000181D4(uint64_t a1)
{
  uint64_t v1 = a1;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = *(id *)(a1 + 32);
  id v57 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v74;
    v53 = (unsigned __int8 *)(v1 + 89);
    v54 = (unsigned __int8 *)(v1 + 88);
    uint64_t v64 = v1;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v74 != v56) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v73 + 1) + 8 * v2);
        id v4 = objc_msgSend(*(id *)(v1 + 40), "fetchAttributesForCall:", v3, v53);
        id v5 = [*(id *)(v1 + 40) fetchCallProviderForCall:v3];
        id v6 = v5;
        if (!v5) {
          goto LABEL_17;
        }
        id v7 = [v5 bundleIdentifier];
        [v4 setRelatedAppBundleIdentifier:v7];

        if (([v6 isTelephonyProvider] & 1) == 0)
        {
          int v8 = [v6 localizedName];
          [v4 setPhoneProvider:v8];
        }
        id v9 = [v3 localParticipantUUID];
        __int16 v10 = [v6 senderIdentityForAccountUUID:v9];
        id v11 = [v10 handle];
        id v12 = [v11 normalizedValue];

        if (v12)
        {
          uint64_t v13 = [*(id *)(v1 + 48) objectForKeyedSubscript:v12];
          int v14 = [v13 firstObject];

          CFStringRef v15 = *(void **)(v1 + 40);
          __int16 v16 = [v3 isoCountryCode];
          id v17 = [v15 personForHandle:v12 isoCountryCode:v16 contact:v14];
        }
        else
        {
          id v17 = 0;
        }
        if ([v6 isFaceTimeProvider])
        {
          id v18 = [v3 mediaType];
          id v19 = v54;
          if (v18 == (id)1 || (id v20 = [v3 mediaType], v19 = v53, v20 == (id)2))
          {
            id v21 = +[NSNumber numberWithInt:*v19 == 0];
            [v4 setDisableSearchInSpotlight:v21];
          }
        }

        if (!v17) {
LABEL_17:
        }
          id v17 = *(id *)(v1 + 56);
        v58 = v17;
        v59 = v6;
        v60 = v4;
        uint64_t v61 = v2;
        id v22 = objc_alloc_init((Class)NSMutableArray);
        id v67 = objc_alloc_init((Class)NSMutableArray);
        id v62 = objc_alloc_init((Class)NSMutableArray);
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v63 = [v3 remoteParticipantHandles];
        v66 = v22;
        id v68 = [v63 countByEnumeratingWithState:&v69 objects:v79 count:16];
        if (v68)
        {
          uint64_t v65 = *(void *)v70;
          LOBYTE(v23) = 1;
          do
          {
            for (i = 0; i != v68; i = (char *)i + 1)
            {
              if (*(void *)v70 != v65) {
                objc_enumerationMutation(v63);
              }
              int v25 = *(void **)(*((void *)&v69 + 1) + 8 * i);
              int v26 = [*(id *)(v1 + 40) contactHandleForHandle:v25];
              id v27 = [*(id *)(v1 + 48) objectForKeyedSubscript:v26];
              id v28 = [v27 firstObject];

              id v29 = *(void **)(v1 + 40);
              [v3 isoCountryCode];
              v31 = uint64_t v30 = v1;
              id v32 = [v29 personForHandle:v26 isoCountryCode:v31 contact:v28];

              [v67 addObject:v32];
              if ([v25 type] == (id)2)
              {
                __int16 v33 = [v25 value];
                [v62 addObject:v33];

                uint64_t v34 = *(void **)(v30 + 40);
                v35 = [v3 isoCountryCode];
                uint64_t v36 = [v34 formattedHandleForComponentSearch:v26 isoCountryCode:v35];

                id v22 = v66;
                [v66 addObject:v36];
              }
              else
              {
                id v22 = v66;
                [v66 addObject:v26];
              }
              int v23 = (v28 == 0) & v23;

              uint64_t v1 = v64;
            }
            id v68 = [v63 countByEnumeratingWithState:&v69 objects:v79 count:16];
          }
          while (v68);
        }
        else
        {
          int v23 = 1;
        }

        if ([v22 count]) {
          [v60 setParticipants:v22];
        }
        v37 = v62;
        if ([v62 count])
        {
          [v60 setPhoneNumbers:v62];
          uint64_t v38 = +[NSNumber numberWithBool:1];
          [v60 setSupportsPhoneCall:v38];
        }
        if ([v67 count])
        {
          if (([v3 callStatus] & 0xD) != 0)
          {
            [v60 setAuthors:v67];
            if (v58)
            {
              v78 = v58;
              v39 = +[NSArray arrayWithObjects:&v78 count:1];
              [v60 setPrimaryRecipients:v39];
              goto LABEL_40;
            }
            [v60 setPrimaryRecipients:0];
          }
          else
          {
            [v60 setPrimaryRecipients:v67];
            if (v58)
            {
              v77 = v58;
              v39 = +[NSArray arrayWithObjects:&v77 count:1];
              [v60 setAuthors:v39];
LABEL_40:
            }
            else
            {
              [v60 setAuthors:0];
            }
          }
          id v40 = [v67 arrayByApplyingSelector:"displayName"];
          id v41 = [v40 componentsJoinedByString:@", "];
          [v60 setDisplayName:v41];
        }
        if (v23)
        {
          uint64_t v42 = [v3 name];
          id v43 = [v42 length];

          if (v43)
          {
            unsigned __int8 v44 = [*(id *)(v1 + 40) isTelephonyCall:v3];
            id v45 = [v3 name];
            if (v44)
            {
              [v60 setContentDescription:v45];

              id v46 = objc_alloc((Class)CSSearchableItem);
              v47 = [v3 uniqueId];
              id v48 = [v3 serviceProvider];
              id v49 = [v46 initWithUniqueIdentifier:v47 domainIdentifier:v48 attributeSet:v60];

              v37 = v62;
              [*(id *)(v1 + 64) addObject:v49];

              goto LABEL_51;
            }
            [v60 setDisplayName:v45];
          }
        }
        v50 = [v3 uniqueId];

        if (v50)
        {
          v51 = *(void **)(v1 + 72);
          v52 = [v3 uniqueId];
          [v51 setObject:v60 forKeyedSubscript:v52];

          [*(id *)(v1 + 80) addObject:v3];
        }
LABEL_51:

        ++v2;
      }
      while ((id)(v61 + 1) != v57);
      id v57 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    }
    while (v57);
  }
}

void sub_100018940(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134217984;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updated TUMetadataCache for %lu calls", buf, 0xCu);
  }

  id v4 = *(NSObject **)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100018ACC;
  v8[3] = &unk_1000495E8;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 80);
  id v14 = *(id *)(a1 + 88);
  dispatch_group_notify(v4, v5, v8);
}

void sub_100018ACC(uint64_t a1)
{
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v6 = [v5 uniqueId];

        if (v6)
        {
          uint64_t v7 = *(void **)(a1 + 48);
          int v8 = [v5 uniqueId];
          id v9 = [v7 objectForKeyedSubscript:v8];

          uint64_t v10 = *(void **)(a1 + 40);
          id v11 = [v5 remoteParticipantHandles];
          id v12 = [v11 anyObject];
          id v13 = [v10 contactHandleForHandle:v12];

          id v14 = [*(id *)(a1 + 56) objectForKeyedSubscript:v13];
          CFStringRef v15 = [v14 firstObject];

          id v16 = [*(id *)(a1 + 40) subtitleProvider];
          id v17 = [v16 localizedSubtitleForRecentCall:v5 handle:v13 contact:v15];

          if (v17)
          {
            id v18 = [*(id *)(a1 + 40) logHandle];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v36 = v17;
              __int16 v37 = 2112;
              uint64_t v38 = v5;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Subtitle %@ found for call: %@", buf, 0x16u);
            }

            [v9 setContentDescription:v17];
          }
          id v19 = objc_alloc((Class)CSSearchableItem);
          id v20 = [v5 uniqueId];
          id v21 = [v5 serviceProvider];
          id v22 = [v19 initWithUniqueIdentifier:v20 domainIdentifier:v21 attributeSet:v9];

          [*(id *)(a1 + 64) addObject:v22];
        }
        else
        {
          id v9 = [*(id *)(a1 + 40) logHandle];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            sub_10002ECA8(&v29, v30, v9);
          }
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v3);
  }

  int v23 = [*(id *)(a1 + 40) csIndex];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100018E5C;
  v27[3] = &unk_1000495C0;
  v27[4] = *(void *)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 64);
  id v28 = *(id *)(a1 + 72);
  [v23 indexSearchableItems:v24 completionHandler:v27];
}

void sub_100018E5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logHandle];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002ECE8();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = objc_opt_class();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully indexed calls to Spotlight %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void sub_100019018(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002ED50();
    }
  }
}

void sub_100019414(uint64_t a1)
{
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = *(id *)(a1 + 32);
  id v42 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v54;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = v2;
        id v3 = *(void **)(*((void *)&v53 + 1) + 8 * v2);
        id v45 = objc_alloc_init((Class)CSSearchableItemAttributeSet);
        id v4 = [*(id *)(a1 + 40) fetchCallProviderForCall:v3];
        id v5 = v3;
        if (!v4) {
          goto LABEL_9;
        }
        uint64_t v6 = [v3 localParticipantUUID];
        int v7 = [v4 senderIdentityForAccountUUID:v6];
        uint64_t v8 = [v7 handle];
        id v9 = [v8 normalizedValue];

        id v3 = v5;
        if (!v9) {
          goto LABEL_9;
        }
        uint64_t v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];
        id v11 = [v10 firstObject];

        id v12 = *(void **)(a1 + 40);
        id v13 = [v5 isoCountryCode];
        id v14 = [v12 personForHandle:v9 isoCountryCode:v13 contact:v11];

        if (!v14) {
LABEL_9:
        }
          id v14 = *(id *)(a1 + 56);
        id v43 = v14;
        unsigned __int8 v44 = v4;
        id v48 = objc_alloc_init((Class)NSMutableArray);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v47 = [v3 remoteParticipantHandles];
        id v15 = [v47 countByEnumeratingWithState:&v49 objects:v59 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v50;
          LOBYTE(v18) = 1;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v50 != v17) {
                objc_enumerationMutation(v47);
              }
              id v20 = [*(id *)(a1 + 40) contactHandleForHandle:*(void *)(*((void *)&v49 + 1) + 8 * i)];
              id v21 = [*(id *)(a1 + 48) objectForKeyedSubscript:v20];
              id v22 = [v21 firstObject];

              int v18 = (v22 == 0) & v18;
              int v23 = *(void **)(a1 + 40);
              uint64_t v24 = [v3 isoCountryCode];
              int v25 = [v23 personForHandle:v20 isoCountryCode:v24 contact:v22];

              id v3 = v5;
              [v48 addObject:v25];
            }
            id v16 = [v47 countByEnumeratingWithState:&v49 objects:v59 count:16];
          }
          while (v16);
        }
        else
        {
          int v18 = 1;
        }

        if ([v48 count])
        {
          if (([v3 callStatus] & 0xD) != 0)
          {
            [v45 setAuthors:v48];
            if (v43)
            {
              v58 = v43;
              uint64_t v26 = +[NSArray arrayWithObjects:&v58 count:1];
              [v45 setPrimaryRecipients:v26];
              goto LABEL_25;
            }
            [v45 setPrimaryRecipients:0];
          }
          else
          {
            [v45 setPrimaryRecipients:v48];
            if (v43)
            {
              id v57 = v43;
              uint64_t v26 = +[NSArray arrayWithObjects:&v57 count:1];
              [v45 setAuthors:v26];
LABEL_25:
            }
            else
            {
              [v45 setAuthors:0];
            }
          }
          id v27 = [v48 arrayByApplyingSelector:"displayName"];
          id v28 = [v27 componentsJoinedByString:@", "];
          [v45 setDisplayName:v28];
        }
        if (v18)
        {
          uint8_t v29 = [v3 name];
          id v30 = [v29 length];

          if (v30)
          {
            unsigned __int8 v31 = [*(id *)(a1 + 40) isTelephonyCall:v3];
            long long v32 = [v3 name];
            if (v31)
            {
              [v45 setContentDescription:v32];

              id v33 = objc_alloc((Class)CSSearchableItem);
              long long v34 = [v3 uniqueId];
              v35 = [v3 serviceProvider];
              id v36 = [v33 initWithUniqueIdentifier:v34 domainIdentifier:v35 attributeSet:v45];

              [v36 setIsUpdate:1];
              [*(id *)(a1 + 64) addObject:v36];

              goto LABEL_36;
            }
            [v45 setDisplayName:v32];
          }
        }
        __int16 v37 = [v3 uniqueId];

        if (v37)
        {
          uint64_t v38 = *(void **)(a1 + 72);
          v39 = [v3 uniqueId];
          [v38 setObject:v45 forKeyedSubscript:v39];

          [*(id *)(a1 + 80) addObject:v3];
        }
LABEL_36:

        uint64_t v2 = v46 + 1;
      }
      while ((id)(v46 + 1) != v42);
      id v42 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v42);
  }
}

void sub_1000199A8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134217984;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updated TUMetadataCache for %lu calls", buf, 0xCu);
  }

  id v4 = *(NSObject **)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019B20;
  block[3] = &unk_100049688;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 80);
  dispatch_group_notify(v4, v5, block);
}

void sub_100019B20(uint64_t a1)
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v26 = *(void *)v31;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v6 = [v5 uniqueId];

        if (v6)
        {
          uint64_t v7 = *(void **)(a1 + 48);
          uint64_t v8 = [v5 uniqueId];
          id v9 = [v7 objectForKeyedSubscript:v8];

          uint64_t v10 = *(void **)(a1 + 40);
          id v11 = [v5 remoteParticipantHandles];
          id v12 = [v11 anyObject];
          id v13 = [v10 contactHandleForHandle:v12];

          id v14 = [*(id *)(a1 + 56) objectForKeyedSubscript:v13];
          id v15 = [v14 firstObject];

          id v16 = [*(id *)(a1 + 40) subtitleProvider];
          uint64_t v17 = [v16 localizedSubtitleForRecentCall:v5 handle:v13 contact:v15];

          if (v17)
          {
            int v18 = [*(id *)(a1 + 40) logHandle];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v35 = v17;
              __int16 v36 = 2112;
              __int16 v37 = v5;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Subtitle %@ found for call: %@", buf, 0x16u);
            }

            [v9 setContentDescription:v17];
          }
          id v19 = objc_alloc((Class)CSSearchableItem);
          id v20 = [v5 uniqueId];
          id v21 = [v5 serviceProvider];
          id v22 = [v19 initWithUniqueIdentifier:v20 domainIdentifier:v21 attributeSet:v9];

          [v22 setIsUpdate:1];
          [*(id *)(a1 + 64) addObject:v22];
        }
        else
        {
          id v9 = [*(id *)(a1 + 40) logHandle];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            sub_10002ECA8(&v28, v29, v9);
          }
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v3);
  }

  int v23 = [*(id *)(a1 + 40) csIndex];
  uint64_t v24 = *(void *)(a1 + 64);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100019EA0;
  v27[3] = &unk_100049638;
  v27[4] = *(void *)(a1 + 40);
  [v23 indexSearchableItems:v24 completionHandler:v27];
}

void sub_100019EA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logHandle];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002ECE8();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = objc_opt_class();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully indexed calls to Spotlight %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void sub_10001A23C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logHandle];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002ECE8();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = objc_opt_class();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully indexed calls to Spotlight %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void sub_10001B5D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_10001B77C(void *a1)
{
  id v2 = +[CHSpotlightSearchQueryUtilities searchStringForCallsMatchingHandles:a1[4] orContactIdentifier:a1[5]];
  id v3 = (void *)a1[6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B828;
  v5[3] = &unk_100049700;
  v5[4] = v3;
  id v6 = v2;
  id v4 = v2;
  [v3 querySpotlightCountWithSearchString:v4 completion:v5];
}

void *sub_10001B828(void *result, unint64_t a2)
{
  if (a2)
  {
    id v3 = result;
    id v4 = (void *)result[4];
    if (a2 < 0x65)
    {
      uint64_t v6 = v3[5];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10001B948;
      v7[3] = &unk_1000496D8;
      v7[4] = v4;
      return [v4 querySpotlightWithSearchString:v6 completion:v7];
    }
    else
    {
      id v5 = [v4 logHandle];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v9 = a2;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Items to reindex for contact change: %lu is greater than threshold, triggering a full reindex", buf, 0xCu);
      }

      return +[CHSpotlightSearchQueryUtilities setCallsNeedsDeferredReindexingForReason:64];
    }
  }
  return result;
}

void sub_10001B948(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 mutableCopy];
  [v2 reindexItemsForContactsUpdate:v3];
}

id sub_10001BA2C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001BAF4;
  v6[3] = &unk_1000496D8;
  v6[4] = v2;
  [v2 indexedFacetimeAudioCallsWithCompletion:v6];
  id v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001BB60;
  v5[3] = &unk_1000496D8;
  v5[4] = v3;
  return [v3 indexedFacetimeVideoCallsWithCompletion:v5];
}

void sub_10001BAF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    objc_msgSend(*(id *)(a1 + 32), "updateSearchableStatusFor:newStatus:", v3, +[TUCallCapabilities supportsFaceTimeAudioCalls](TUCallCapabilities, "supportsFaceTimeAudioCalls"));
  }
}

void sub_10001BB60(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    objc_msgSend(*(id *)(a1 + 32), "updateSearchableStatusFor:newStatus:", v3, +[TUCallCapabilities supportsFaceTimeVideoCalls](TUCallCapabilities, "supportsFaceTimeVideoCalls"));
  }
}

void sub_10001BF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001BF34(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a2;
  return result;
}

void sub_10001BF4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v7 = 134217984;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Total no. of found items: %lu", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    uint64_t v6 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002EE98();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_10001C298(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

void sub_10001C2A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 40) count];
    int v7 = 134217984;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Total no. of found items: %lu", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    uint64_t v6 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002EE98();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id sub_10001CC0C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) fetchContacts];
}

void sub_10001D8D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10001DB00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001DBC4;
    v9[3] = &unk_1000490D8;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    dispatch_async(v6, v9);
  }
}

id sub_10001DBC4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) propertiesDidChangeForConfiguration:*(void *)(a1 + 40)];
}

void sub_10001DE58(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Querying for initial device list", buf, 2u);
  }

  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) devices];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v22;
    *(void *)&long long v5 = 138543618;
    long long v20 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDefaultPairedDevice", v20))
        {
          id v10 = [[CHIDSPeerDevice alloc] initWithDevice:v9 withPairedSyncCoordinator:*(void *)(*(void *)(a1 + 32) + 40) withConfiguration:*(unsigned int *)(*(void *)(a1 + 32) + 24)];
          uint64_t v11 = *(void **)(a1 + 32);
          id v12 = (void *)v11[1];
          id v13 = [v11 queue];
          [v12 addDelegate:v10 queue:v13];

          id v14 = *(void **)(*(void *)(a1 + 32) + 16);
          id v15 = [v9 uniqueIDOverride];
          [v14 setObject:v10 forKey:v15];
        }
        else
        {
          id v10 = [*(id *)(a1 + 32) logHandle];
          if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = [v9 name];
            uint64_t v17 = [v9 uniqueIDOverride];
            *(_DWORD *)buf = v20;
            id v26 = v16;
            __int16 v27 = 2114;
            uint8_t v28 = v17;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Skipping device (not default-paired) name(%{public}@) id(%{public}@)", buf, 0x16u);
          }
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v6);
  }
  int v18 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [*(id *)(*(void *)(a1 + 32) + 16) count];
    *(_DWORD *)buf = 134217984;
    id v26 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found %lu initial devices", buf, 0xCu);
  }

  sub_10001E160(*(void **)(*(void *)(a1 + 32) + 16));
  [*(id *)(a1 + 32) checkForBootstrapDeviceChanges];
}

void sub_10001E160(void *a1)
{
  id v1 = a1;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = [v1 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v24;
    id v6 = &_s10Foundation22_convertNSErrorToErrorys0E0_pSo0C0CSgF_ptr;
    *(void *)&long long v3 = 138544386;
    long long v21 = v3;
    id v22 = v1;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v8 = objc_msgSend(v1, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * (void)v7), v21);
        uint64_t v9 = [v8 device];
        id v10 = [v6[251] sharedInstance];
        uint64_t v11 = [v10 logHandleForDomain:"IDSService"];

        id v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v9 uniqueIDOverride];
          id v14 = [v9 name];
          [v9 modelIdentifier];
          v16 = uint64_t v15 = v5;
          id v17 = v4;
          unsigned int v18 = [v9 isDefaultPairedDevice];
          unsigned int v19 = [v9 isNearby];
          *(_DWORD *)buf = v21;
          long long v20 = "no";
          if (v19) {
            long long v20 = "yes";
          }
          uint8_t v28 = v13;
          __int16 v29 = 2114;
          long long v30 = v14;
          __int16 v31 = 2114;
          long long v32 = v16;
          __int16 v33 = 1024;
          unsigned int v34 = v18;
          id v4 = v17;
          __int16 v35 = 2082;
          __int16 v36 = v20;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "id(%{public}@) name(%{public}@) modelIdentifier(%{public}@) isDefaultPairedDevice(%d) nearby(%{public}s)", buf, 0x30u);

          uint64_t v5 = v15;
          id v1 = v22;

          id v6 = &_s10Foundation22_convertNSErrorToErrorys0E0_pSo0C0CSgF_ptr;
        }

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v1 countByEnumeratingWithState:&v23 objects:v37 count:16];
    }
    while (v4);
  }
}

void sub_10001E4A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 24))
  {
    if (*(void *)(v2 + 16) && (v3 = [*(id *)(v2 + 16) count], uint64_t v2 = *(void *)(a1 + 32), v3))
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v4 = *(id *)(v2 + 16);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
            [v9 sendTransactions:*(void *)(a1 + 40) withService:*(void *)(*(void *)(a1 + 32) + 8)];
          }
          id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
        }
        while (v6);
      }
    }
    else
    {
      id v4 = [(id)v2 logHandle];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No connected devices, nothing to send to!", buf, 2u);
      }
    }
  }
}

void sub_10001E7E0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = [v1 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v3)
    {
      id v5 = v3;
      uint64_t v6 = *(void *)v15;
      *(void *)&long long v4 = 138543362;
      long long v13 = v4;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v9 = +[CHLogServer sharedInstance];
          long long v10 = [v9 logHandleForDomain:"IDSService"];

          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v8;
            _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
          }
        }
        id v5 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v5);
    }
  }
  else
  {
    long long v11 = +[CHLogServer sharedInstance];
    long long v12 = [v11 logHandleForDomain:"IDSService"];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10002EF38(v12);
    }
  }
}

void sub_100020190(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting initial sync", buf, 2u);
  }

  long long v25 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v4)
  {
    id v5 = v4;
    char v23 = 0;
    uint64_t v26 = *(void *)v28;
    id v24 = v3;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v26) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        uint64_t v8 = [v7 device];
        uint64_t v9 = [v8 uniqueIDOverride];
        long long v10 = [*(id *)(a1 + 32) bootstrappedDeviceUuids];
        unsigned int v11 = [v10 containsObject:v9];

        if (v11)
        {
          [v25 addObject:v9];
          long long v12 = [*(id *)(a1 + 32) logHandle];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            long long v13 = [v8 uniqueIDOverride];
            long long v14 = [v8 name];
            long long v15 = [v8 modelIdentifier];
            *(_DWORD *)buf = 138543874;
            long long v32 = v13;
            __int16 v33 = 2114;
            unsigned int v34 = v14;
            __int16 v35 = 2114;
            __int16 v36 = v15;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Already sent bootstrap data store device(%{public}@) to name(%{public}@) model(%{public}@)", buf, 0x20u);

            id v3 = v24;
          }
LABEL_17:

          goto LABEL_18;
        }
        unsigned __int8 v16 = [v8 isConnected];
        long long v12 = [*(id *)(a1 + 32) logHandle];
        BOOL v17 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if ((v16 & 1) == 0)
        {
          if (v17)
          {
            long long v20 = [v8 uniqueIDOverride];
            long long v21 = [v8 name];
            id v22 = [v8 modelIdentifier];
            *(_DWORD *)buf = 138543874;
            long long v32 = v20;
            __int16 v33 = 2114;
            unsigned int v34 = v21;
            __int16 v35 = 2114;
            __int16 v36 = v22;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device(%{public}@) name(%{public}@) model(%{public}@) is not connected, skipping", buf, 0x20u);

            id v3 = v24;
          }
          goto LABEL_17;
        }
        if (v17)
        {
          unsigned int v18 = [v8 name];
          uint64_t v19 = [v8 modelIdentifier];
          *(_DWORD *)buf = 138543874;
          long long v32 = v18;
          __int16 v33 = 2114;
          unsigned int v34 = v19;
          __int16 v35 = 2114;
          __int16 v36 = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "New bootstrapped device detected! name(%{public}@) model(%{public}@) id(%{public}@)", buf, 0x20u);

          id v3 = v24;
        }

        [v25 addObject:v9];
        [v7 sendBootstrapDataStoreWithService:*(void *)(*(void *)(a1 + 32) + 8)];
        char v23 = 1;
LABEL_18:
      }
      id v5 = [v3 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (!v5)
      {

        if (v23) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
  }

LABEL_23:
  [*(id *)(*(void *)(a1 + 32) + 40) syncComplete];
LABEL_24:
  [*(id *)(a1 + 32) rememberBootstrappedDevices:v25];
}

void sub_10002063C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting reunion sync", buf, 2u);
  }

  long long v14 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 138543362;
    long long v13 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v8), v13);
        long long v10 = [v9 device];
        unsigned int v11 = [v10 uniqueIDOverride];
        if ([v10 isConnected])
        {
          long long v12 = [*(id *)(a1 + 32) logHandle];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            long long v20 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Initiating reunion sync with %{public}@", buf, 0xCu);
          }

          [v14 addObject:v11];
          [v9 setStatus:2];
          [v9 flushTransactionsWithService:*(void *)(*(void *)(a1 + 32) + 8)];
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 32) rememberBootstrappedDevices:v14];
  [*(id *)(*(void *)(a1 + 32) + 40) syncComplete];
}

const char *sub_100020970(unsigned int a1)
{
  if (a1 > 2) {
    return "(unknown)";
  }
  else {
    return off_100049830[a1];
  }
}

uint64_t sub_100020994()
{
  v0 = sub_10002160C();
  id v1 = +[NSUserDefaults standardUserDefaults];
  CFStringRef v15 = @"IDSConfiguration";
  long long v16 = v0;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v1 registerDefaults:v2];

  id v3 = [v1 stringForKey:@"IDSConfiguration"];
  if (([v3 isEqualToString:@"IDSDisabled"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"IDSClient"])
    {
      uint64_t v4 = 2;
      goto LABEL_10;
    }
    if ([v3 isEqualToString:@"IDSServer"])
    {
      uint64_t v4 = 1;
      goto LABEL_10;
    }
    long long v5 = +[CHLogServer sharedInstance];
    id v6 = [v5 logHandleForDomain:"IDSConfiguration"];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      CFStringRef v12 = @"IDSConfiguration";
      __int16 v13 = 2114;
      long long v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unknown %{public}@ configuration value (%{public}@), assuming disabled!", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v4 = 0;
LABEL_10:
  uint64_t v7 = +[CHLogServer sharedInstance];
  uint64_t v8 = [v7 logHandleForDomain:"IDSConfiguration"];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = off_100049830[v4];
    int v11 = 136446210;
    CFStringRef v12 = (const __CFString *)v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current IDS Configuration: %{public}s", (uint8_t *)&v11, 0xCu);
  }

  return v4;
}

uint64_t sub_100020F18(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    unint64_t v12 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      uint64_t v18 = PBReaderReadString();
      uint64_t v19 = 8;
    }
    else
    {
      if (v12 != 2)
      {
        if (v12 == 1)
        {
          char v13 = 0;
          unsigned int v14 = 0;
          uint64_t v15 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          while (1)
          {
            unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
            v15 |= (unint64_t)(v17 & 0x7F) << v13;
            if ((v17 & 0x80) == 0) {
              goto LABEL_33;
            }
            v13 += 7;
            BOOL v9 = v14++ >= 9;
            if (v9)
            {
              LODWORD(v15) = 0;
              goto LABEL_35;
            }
          }
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_33:
          if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v15) = 0;
          }
LABEL_35:
          *(_DWORD *)(a1 + 16) = v15;
        }
        else
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
        }
        continue;
      }
      uint64_t v18 = PBReaderReadString();
      uint64_t v19 = 24;
    }
    long long v20 = *(void **)(a1 + v19);
    *(void *)(a1 + v19) = v18;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

CFStringRef sub_10002160C()
{
  return @"IDSServer";
}

BOOL CHHandleTypeToINPersonHandleType(BOOL result)
{
  if (result != 2) {
    return result == 3;
  }
  return result;
}

id CHHandleToINPersonHandle(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v45 = a3;
  if (!v6) {
    goto LABEL_31;
  }
  id v46 = v5;
  if ([v5 type] == (id)2)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = [v6 phoneNumbers];
    id v7 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v7)
    {
      id v8 = v7;
      id v43 = v6;
      BOOL v9 = 0;
      uint64_t v10 = *(void *)v53;
      while (1)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v53 != v10) {
            objc_enumerationMutation(obj);
          }
          unint64_t v12 = [*(id *)(*((void *)&v52 + 1) + 8 * i) value];
          char v13 = [v12 stringValue];

          unsigned int v14 = [v5 value];
          if ([v14 isEqualToString:v13])
          {

LABEL_11:
            INPersonHandleLabelForCNLabeledValue();
            BOOL v9 = v17 = v9;
            goto LABEL_17;
          }
          uint64_t v15 = [v5 normalizedValue];
          unsigned int v16 = [v15 isEqualToString:v13];

          if (v16) {
            goto LABEL_11;
          }
          id v17 = [objc_alloc((Class)CHPhoneNumber) initWithDigits:v13 isoCountryCode:v45];
          uint64_t v18 = [v17 normalizedRepresentation];
          uint64_t v19 = [v5 value];
          if ([v19 isEqualToString:v18])
          {

LABEL_15:
            uint64_t v24 = INPersonHandleLabelForCNLabeledValue();

            BOOL v9 = (void *)v24;
            goto LABEL_16;
          }
          [v5 normalizedValue];
          unsigned __int8 v44 = v9;
          id v20 = v8;
          id v22 = v21 = v10;
          unsigned int v23 = [v22 isEqualToString:v18];

          uint64_t v10 = v21;
          id v8 = v20;
          BOOL v9 = v44;

          if (v23) {
            goto LABEL_15;
          }
LABEL_16:

          id v5 = v46;
LABEL_17:
        }
        id v8 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (!v8)
        {
          id v6 = v43;
          goto LABEL_33;
        }
      }
    }
    goto LABEL_32;
  }
  if ([v5 type] != (id)3)
  {
LABEL_31:
    BOOL v9 = 0;
    goto LABEL_34;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v6 emailAddresses];
  id v25 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v25)
  {
    id v26 = v25;
    BOOL v9 = 0;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(obj);
        }
        long long v29 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) value];
        long long v30 = [v5 value];
        id v31 = [v29 compare:v30 options:1];

        if (!v31)
        {
          uint64_t v32 = INPersonHandleLabelForCNLabeledValue();

          BOOL v9 = (void *)v32;
        }
        id v5 = v46;
      }
      id v26 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v26);
    goto LABEL_33;
  }
LABEL_32:
  BOOL v9 = 0;
LABEL_33:

LABEL_34:
  __int16 v33 = [v5 normalizedValue];
  unsigned int v34 = v33;
  if (v33)
  {
    id v35 = v33;
  }
  else
  {
    id v35 = [v5 value];
  }
  __int16 v36 = v5;
  __int16 v37 = v35;

  id v38 = objc_alloc((Class)INPersonHandle);
  id v39 = [v36 type];
  if (v39 == (id)2) {
    uint64_t v40 = 2;
  }
  else {
    uint64_t v40 = v39 == (id)3;
  }
  id v41 = [v38 initWithValue:v37 type:v40 label:v9];

  return v41;
}

uint64_t CHServiceProviderToINPreferredCallProvider(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.FaceTime"]) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.Telephony"];
  }

  return v2;
}

uint64_t CHCallStatusToINInteractionDirection(int a1)
{
  if ((a1 & 0x12) != 0) {
    return 1;
  }
  if ((a1 & 0xD) != 0) {
    return 2;
  }
  id v3 = +[CHLogServer sharedInstance];
  char v4 = [v3 logHandleForDomain:"intent"];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unknown call direction: 0x%x", (uint8_t *)v5, 8u);
  }

  return 0;
}

uint64_t CHTTYTypeToINTTYType(uint64_t a1)
{
  uint64_t v1 = 3;
  if (a1 != 2) {
    uint64_t v1 = 1;
  }
  if (a1 == 1) {
    return 2;
  }
  else {
    return v1;
  }
}

BOOL CHRecentCallMediaTypeToINCallCapability(BOOL result)
{
  if (result)
  {
    if (result != 2) {
      return result == 1;
    }
  }
  else
  {
    uint64_t v1 = +[CHLogServer sharedInstance];
    uint64_t v2 = [v1 logHandleForDomain:"intent"];

    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 134217984;
      uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unknown media type: %ld", (uint8_t *)&v3, 0xCu);
    }

    return 0;
  }
  return result;
}

uint64_t sub_100022D40(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 200;
        goto LABEL_126;
      case 2u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 56;
        goto LABEL_126;
      case 3u:
        *(_DWORD *)(a1 + 220) |= 1u;
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 <= 0xFFFFFFFFFFFFFFF7 && v16 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v17 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v17 = 0;
        }
        uint64_t v92 = 8;
        goto LABEL_202;
      case 4u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x80u;
        while (2)
        {
          uint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v22 = v21 + 1;
          if (v21 == -1 || v22 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if (v23 < 0)
            {
              v18 += 7;
              BOOL v10 = v19++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_144;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_144:
        uint64_t v91 = 48;
        goto LABEL_193;
      case 5u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x40u;
        while (2)
        {
          uint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v27;
            v20 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              BOOL v10 = v25++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_148;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_148:
        uint64_t v91 = 44;
        goto LABEL_193;
      case 6u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x100u;
        while (2)
        {
          uint64_t v31 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v31);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v32;
            v20 |= (unint64_t)(v33 & 0x7F) << v29;
            if (v33 < 0)
            {
              v29 += 7;
              BOOL v10 = v30++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_152;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_152:
        uint64_t v91 = 64;
        goto LABEL_193;
      case 7u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v36 = 0;
        *(_DWORD *)(a1 + 220) |= 0x10000u;
        while (2)
        {
          uint64_t v37 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v38 = v37 + 1;
          if (v37 == -1 || v38 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v39 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v37);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v38;
            v36 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              BOOL v10 = v35++ >= 9;
              if (v10)
              {
                uint64_t v36 = 0;
                goto LABEL_156;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v36 = 0;
        }
LABEL_156:
        *(unsigned char *)(a1 + 216) = v36 != 0;
        goto LABEL_203;
      case 8u:
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x4000u;
        while (2)
        {
          uint64_t v42 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v43 = v42 + 1;
          if (v42 == -1 || v43 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v42);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v43;
            v20 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              BOOL v10 = v41++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_160;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_160:
        uint64_t v91 = 208;
        goto LABEL_193;
      case 9u:
        *(_DWORD *)(a1 + 220) |= 2u;
        unint64_t v45 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v17 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v45);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v45 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v17 = 0;
        }
        uint64_t v92 = 16;
        goto LABEL_202;
      case 0xAu:
        *(_DWORD *)(a1 + 220) |= 0x10u;
        unint64_t v46 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v46 <= 0xFFFFFFFFFFFFFFFBLL && v46 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          int v47 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v46);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v46 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          int v47 = 0;
        }
        *(_DWORD *)(a1 + 36) = v47;
        goto LABEL_203;
      case 0xBu:
        char v48 = 0;
        unsigned int v49 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x800u;
        while (2)
        {
          uint64_t v50 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v51 = v50 + 1;
          if (v50 == -1 || v51 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v52 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v50);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v51;
            v20 |= (unint64_t)(v52 & 0x7F) << v48;
            if (v52 < 0)
            {
              v48 += 7;
              BOOL v10 = v49++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_164;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_164:
        uint64_t v91 = 144;
        goto LABEL_193;
      case 0xCu:
        char v53 = 0;
        unsigned int v54 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x1000u;
        while (2)
        {
          uint64_t v55 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v56 = v55 + 1;
          if (v55 == -1 || v56 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v57 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v55);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v56;
            v20 |= (unint64_t)(v57 & 0x7F) << v53;
            if (v57 < 0)
            {
              v53 += 7;
              BOOL v10 = v54++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_168;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_168:
        uint64_t v91 = 148;
        goto LABEL_193;
      case 0xDu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 96;
        goto LABEL_126;
      case 0xEu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 192;
        goto LABEL_126;
      case 0xFu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 112;
        goto LABEL_126;
      case 0x10u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 72;
        goto LABEL_126;
      case 0x11u:
        char v58 = 0;
        unsigned int v59 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x20u;
        while (2)
        {
          uint64_t v60 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v61 = v60 + 1;
          if (v60 == -1 || v61 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v62 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v60);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v61;
            v20 |= (unint64_t)(v62 & 0x7F) << v58;
            if (v62 < 0)
            {
              v58 += 7;
              BOOL v10 = v59++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_172;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_172:
        uint64_t v91 = 40;
        goto LABEL_193;
      case 0x12u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 184;
        goto LABEL_126;
      case 0x13u:
        char v63 = 0;
        unsigned int v64 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x200u;
        while (2)
        {
          uint64_t v65 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v66 = v65 + 1;
          if (v65 == -1 || v66 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v67 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v65);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v66;
            v20 |= (unint64_t)(v67 & 0x7F) << v63;
            if (v67 < 0)
            {
              v63 += 7;
              BOOL v10 = v64++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_176;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_176:
        uint64_t v91 = 104;
        goto LABEL_193;
      case 0x14u:
        *(_DWORD *)(a1 + 220) |= 4u;
        unint64_t v68 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v68 <= 0xFFFFFFFFFFFFFFF7 && v68 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v17 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v68);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v68 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v17 = 0;
        }
        uint64_t v92 = 24;
LABEL_202:
        *(void *)(a1 + v92) = v17;
        goto LABEL_203;
      case 0x15u:
        long long v69 = objc_alloc_init(CHHandlePb);
        objc_storeStrong((id *)(a1 + 128), v69);
        goto LABEL_104;
      case 0x16u:
        long long v69 = objc_alloc_init(CHHandlePb);
        [(id)a1 addRemoteParticipantHandles:v69];
LABEL_104:
        if PBReaderPlaceMark() && (sub_100020F18((uint64_t)v69, a2))
        {
          PBReaderRecallMark();

LABEL_203:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      case 0x17u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 136;
        goto LABEL_126;
      case 0x18u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 152;
        goto LABEL_126;
      case 0x19u:
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x400u;
        while (2)
        {
          uint64_t v72 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v73 = v72 + 1;
          if (v72 == -1 || v73 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v74 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v72);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v73;
            v20 |= (unint64_t)(v74 & 0x7F) << v70;
            if (v74 < 0)
            {
              v70 += 7;
              BOOL v10 = v71++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_180;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_180:
        uint64_t v91 = 120;
        goto LABEL_193;
      case 0x1Au:
        char v75 = 0;
        unsigned int v76 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x8000u;
        while (2)
        {
          uint64_t v77 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v78 = v77 + 1;
          if (v77 == -1 || v78 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v79 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v77);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v78;
            v20 |= (unint64_t)(v79 & 0x7F) << v75;
            if (v79 < 0)
            {
              v75 += 7;
              BOOL v10 = v76++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_184;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_184:
        uint64_t v91 = 212;
        goto LABEL_193;
      case 0x1Bu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 80;
        goto LABEL_126;
      case 0x1Cu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 160;
        goto LABEL_126;
      case 0x1Du:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 88;
LABEL_126:
        v80 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        goto LABEL_203;
      case 0x1Eu:
        char v81 = 0;
        unsigned int v82 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 8u;
        while (2)
        {
          uint64_t v83 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v84 = v83 + 1;
          if (v83 == -1 || v84 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v85 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v83);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v84;
            v20 |= (unint64_t)(v85 & 0x7F) << v81;
            if (v85 < 0)
            {
              v81 += 7;
              BOOL v10 = v82++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_188;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_188:
        uint64_t v91 = 32;
        goto LABEL_193;
      case 0x1Fu:
        char v86 = 0;
        unsigned int v87 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 220) |= 0x2000u;
        while (2)
        {
          uint64_t v88 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v89 = v88 + 1;
          if (v88 == -1 || v89 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v90 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v88);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v89;
            v20 |= (unint64_t)(v90 & 0x7F) << v86;
            if (v90 < 0)
            {
              v86 += 7;
              BOOL v10 = v87++ >= 9;
              if (v10)
              {
                LODWORD(v20) = 0;
                goto LABEL_192;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_192:
        uint64_t v91 = 176;
LABEL_193:
        *(_DWORD *)(a1 + v91) = v20;
        goto LABEL_203;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_203;
    }
  }
}

CFStringRef sub_100025E00(unsigned int a1)
{
  if (a1 > 2) {
    return @"???";
  }
  else {
    return off_100049880[(char)a1];
  }
}

uint64_t sub_100025E28(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    int v3 = +[CHLogServer sharedInstance];
    char v4 = [v3 logHandleForDomain:"SyncSource"];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalid source number", (uint8_t *)&v9, 2u);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned int v5 = +[CHLogServer sharedInstance];
    unint64_t v6 = [v5 logHandleForDomain:"SyncSource"];

    char v4 = v6;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v7 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Expected source to be of type %{public}@", (uint8_t *)&v9, 0xCu);
    }
LABEL_11:

LABEL_12:
    unsigned __int8 v2 = 0;
    goto LABEL_13;
  }
  if ((int)[v1 intValue] < 1 || (int)objc_msgSend(v1, "intValue") > 2) {
    goto LABEL_12;
  }
  unsigned __int8 v2 = [v1 intValue];
LABEL_13:

  return v2;
}

void sub_1000260B4(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  unsigned __int8 v2 = [*(id *)(a1 + 32) defaultLogDirectory];
  int v3 = +[NSURL fileURLWithPath:v2];
  char DirectoryAtPath = createDirectoryAtPath();

  unsigned int v5 = [*v1 logHandle];
  unint64_t v6 = v5;
  if (DirectoryAtPath)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Created transaction log directory successfully", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10002F26C(v1);
  }

  id v7 = +[NSFileManager defaultManager];
  unint64_t v8 = [*v1 path];
  unsigned __int8 v9 = [v7 fileExistsAtPath:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = [*v1 path];
    unsigned int v11 = [v7 createFileAtPath:v10 contents:0 attributes:0];

    unint64_t v12 = [*v1 logHandle];
    uint64_t v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [*v1 path];
        int v17 = 138543362;
        id v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Created empty transaction log at %{public}@", (uint8_t *)&v17, 0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      sub_10002F1E4(v1);
    }
  }
  [*v1 migrateFromKeyedArchiverSync];
  [*v1 initializeTransactionCountSync];
  uint64_t v15 = [*v1 logHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [*v1 transactionCount];
    int v17 = 134217984;
    id v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Initialized with %lu transactions", (uint8_t *)&v17, 0xCu);
  }
}

id sub_1000266C0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) appendSync:*(void *)(a1 + 40)];
}

id sub_100026ACC(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearSync];
}

id sub_100026C74(uint64_t a1)
{
  return _[*(id *)(a1 + 32) getNTransactionsSync:*(void *)(a1 + 40)];
}

id sub_100026D00(uint64_t a1)
{
  return [*(id *)(a1 + 32) getSomeTransactionsSync];
}

void sub_100026F88(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    char v4 = [v2 logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002F378();
    }

    objc_end_catch();
    JUMPOUT(0x100026ECCLL);
  }
  _Unwind_Resume(exception_object);
}

id sub_100027070(uint64_t a1)
{
  return _[*(id *)(a1 + 32) readTransactionsProcessedSync:*(void *)(a1 + 40)];
}

id sub_1000271B4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) getNTransactionsSync:0x7FFFFFFFFFFFFFFFLL];
}

void sub_100027264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10002727C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) transactionCount];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_10002781C(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    char v4 = [v2 logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002F4D8();
    }

    objc_end_catch();
    JUMPOUT(0x1000277C8);
  }
  _Unwind_Resume(exception_object);
}

void sub_100027A18(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    char v4 = [v2 logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002F5A8();
    }

    objc_end_catch();
    JUMPOUT(0x1000279D8);
  }
  _Unwind_Resume(exception_object);
}

id sub_100027B74(void *a1)
{
  id v1 = a1;
  id v22 = (id)objc_opt_new();
  unsigned __int8 v2 = +[CHLogServer sharedInstance];
  id v3 = [v2 logHandleForDomain:"IDSUtilities"];

  char v4 = v3;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [v1 calls];
    *(_DWORD *)buf = 134217984;
    id v29 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Converting %lu calls", buf, 0xCu);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v21 = v1;
  unint64_t v6 = [v1 calls];
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        unint64_t v12 = [v11 chRecentCall];
        id v23 = 0;
        uint64_t v13 = [v12 archivedDataWithError:&v23];
        id v14 = v23;
        uint64_t v15 = v14;
        if (v13)
        {
          id v16 = objc_alloc((Class)CHTransaction);
          int v17 = [v11 transaction];
          id v18 = [v16 initWithString:v17 andRecord:v13];

          [v22 addObject:v18];
        }
        else
        {
          if (!v14) {
            goto LABEL_14;
          }
          unsigned int v19 = +[CHLogServer sharedInstance];
          id v18 = [v19 logHandleForDomain:"IDSUtilities"];

          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v29 = v12;
            __int16 v30 = 2112;
            uint64_t v31 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Attempt to archive %@ failed with error %@", buf, 0x16u);
          }
        }

LABEL_14:
      }
      id v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }

  return v22;
}

TransactionsPb *sub_100027E58(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = objc_alloc_init(TransactionsPb);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v1;
  id v3 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v3)
  {
    id v5 = v3;
    id v6 = 0;
    uint64_t v7 = *(void *)v21;
    *(void *)&long long v4 = 138543618;
    long long v17 = v4;
    while (1)
    {
      id v8 = 0;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v8);
        unsigned int v11 = objc_msgSend(v10, "record", v17);
        id v19 = v9;
        unint64_t v12 = +[CHRecentCall unarchivedObjectFromData:v11 error:&v19];
        id v6 = v19;

        if (v12)
        {
          uint64_t v13 = +[CHRecentCallPb protoRecentCallWithRecentCall:v12];
          id v14 = +[CHTransaction toString:](CHTransaction, "toString:", [v10 transactionType]);
          [v13 setTransaction:v14];

          [(TransactionsPb *)v2 addCalls:v13];
        }
        else
        {
          if (!v6) {
            goto LABEL_12;
          }
          uint64_t v15 = +[CHLogServer sharedInstance];
          uint64_t v13 = [v15 logHandleForDomain:"IDSUtilities"];

          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            long long v25 = v10;
            __int16 v26 = 2114;
            id v27 = v6;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Attempt to unarchive CHRecentCall from transaction %{public}@ failed with error %{public}@", buf, 0x16u);
          }
        }

LABEL_12:
        id v8 = (char *)v8 + 1;
        uint64_t v9 = v6;
      }
      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (!v5)
      {

        break;
      }
    }
  }

  return v2;
}

const char *sub_1000280D0(unsigned int a1)
{
  if (a1 > 2) {
    return "(unknown)";
  }
  else {
    return off_100049930[a1];
  }
}

void sub_100028B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id location)
{
}

uint64_t sub_100028B6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100028B7C(uint64_t a1)
{
}

void sub_100028B84(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = +[CHLogServer sharedInstance];
  id v5 = [v4 logHandleForDomain:"intent"];

  id v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v3 name];
    id v8 = [*(id *)(a1 + 32) uniqueId];
    int v11 = 138543618;
    unint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling %{public}@ for call with identifier %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = [*(id *)(a1 + 32) interaction];

  if (v9) {
    notify_post("com.apple.callhistory.notification.call-interactions-changed");
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) name:*(void *)(a1 + 40) object:*(void *)(a1 + 48)];
}

void sub_100028CF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = +[CHLogServer sharedInstance];
  id v6 = [v5 logHandleForDomain:"intent"];

  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002F6FC(a1, (uint64_t)v3, v6);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully donated interaction %@ for call with identifier %{public}@", (uint8_t *)&v9, 0x16u);
  }

  +[INSchema _resetCache];
}

void sub_100029128(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = +[CHLogServer sharedInstance];
  id v5 = [v4 logHandleForDomain:"intent"];

  id v6 = v5;
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002F788(a1, (uint64_t)v3, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) count];
    int v9 = 134217984;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleting interaction for %lu calls succeeded", (uint8_t *)&v9, 0xCu);
  }

  +[INSchema _resetCache];
}

Class sub_10002925C(uint64_t a1)
{
  sub_1000292B4();
  Class result = objc_getClass("_DKSystemEventStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10002F828();
  }
  qword_100053E78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000292B4()
{
  v3[0] = 0;
  if (!qword_100053E80)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_1000293B4;
    v3[4] = &unk_1000499B0;
    v3[5] = v3;
    long long v4 = off_100049998;
    uint64_t v5 = 0;
    qword_100053E80 = _sl_dlopen();
  }
  uint64_t v0 = qword_100053E80;
  id v1 = (void *)v3[0];
  if (!qword_100053E80)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_1000293B4()
{
  uint64_t result = _sl_dlopen();
  qword_100053E80 = result;
  return result;
}

void *sub_100029428(uint64_t a1)
{
  unsigned __int8 v2 = (void *)sub_1000292B4();
  uint64_t result = dlsym(v2, "_DKKnowledgeStorageDidInsertEventsNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100053E88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100029478()
{
  return 0;
}

uint64_t sub_100029480()
{
  return 0;
}

uint64_t sub_100029488()
{
  return Logger.init(subsystem:category:)();
}

char *sub_1000294C0(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_1000294F4(a1);
}

char *sub_1000294F4(void *a1)
{
  unsigned __int8 v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(_DWORD *)&v2[OBJC_IVAR___CHSpotlightReindexManager_callDirectoryNotificationToken] = 0;
  uint64_t v5 = v2;
  Logger.init(subsystem:category:)();
  id v6 = [objc_allocWithZone((Class)CHFeatureFlags) init];
  *(void *)&v5[OBJC_IVAR___CHSpotlightReindexManager_featureFlags] = v6;
  swift_unknownObjectWeakAssign();
  id v7 = [self standardUserDefaults];
  *(void *)&v5[OBJC_IVAR___CHSpotlightReindexManager_userDefaults] = v7;
  id v8 = [objc_allocWithZone((Class)CHManager) init];
  *(void *)&v5[OBJC_IVAR___CHSpotlightReindexManager_callHistoryManager] = v8;
  id v9 = [objc_allocWithZone((Class)CXCallDirectoryExtensionManager) init];
  *(void *)&v5[OBJC_IVAR___CHSpotlightReindexManager_callDirectoryManager] = v9;

  v30.receiver = v5;
  v30.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v30, "init");
  __int16 v11 = self;
  uint64_t v12 = (char *)v10;
  id v13 = [v11 defaultCenter];
  [v13 addObserver:v12 selector:"handleLocaleChanges" name:NSCurrentLocaleDidChangeNotification object:0];

  id v14 = [v11 defaultCenter];
  [v14 addObserver:v12 selector:"handleFaceTimeStatusChanged" name:TUCallCapabilitiesFaceTimeAvailabilityChangedNotification object:0];

  uint64_t v15 = (const char *)CXCallDirectoryManagerIdentificationEntriesChangedNotification;
  sub_10002C8F8(0, &qword_100053DA0);
  id v16 = static OS_dispatch_queue.main.getter();
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v29[4] = sub_100029FD8;
  v29[5] = v17;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 1107296256;
  v29[2] = sub_100029A24;
  v29[3] = &unk_1000499F8;
  id v18 = _Block_copy(v29);
  swift_release();
  id v19 = (int *)&v12[OBJC_IVAR___CHSpotlightReindexManager_callDirectoryNotificationToken];
  swift_beginAccess();
  notify_register_dispatch(v15, v19, v16, v18);
  swift_endAccess();
  _Block_release(v18);

  sub_100029A78();
  sub_100029C04();
  if (sub_100029D34())
  {
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      long long v21 = Strong;
      [Strong updateFacetimeCallsSearchableStatus];
    }
    long long v22 = *(void **)&v12[OBJC_IVAR___CHSpotlightReindexManager_userDefaults];
    long long v23 = self;
    unsigned int v24 = [v23 supportsFaceTimeAudioCalls];
    unsigned int v25 = [v23 supportsFaceTimeVideoCalls];
    uint64_t v26 = 2;
    if (v24) {
      uint64_t v26 = 3;
    }
    if (v25) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = v24;
    }
    [v22 setInteger:v27 forKey:@"CHFacetimeSearchableStatus"];
  }

  return v12;
}

void sub_1000298C8()
{
  id v1 = v0;
  unsigned __int8 v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    long long v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Handling CXCallDirectoryManagerIdentificationEntriesChangedNotification", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = *(void **)&v1[OBJC_IVAR___CHSpotlightReindexManager_callDirectoryManager];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v1;
  void v9[4] = sub_10002CA44;
  void v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10002A0D4;
  v9[3] = &unk_100049C00;
  id v7 = _Block_copy(v9);
  id v8 = v1;
  swift_release();
  [v5 getLastUpdatedCallDirectoryInfoWithReply:v7];
  _Block_release(v7);
}

uint64_t sub_100029A24(uint64_t a1, uint64_t a2)
{
  os_log_type_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_100029A78()
{
  uint64_t v1 = type metadata accessor for Locale();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  long long v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [*(id *)(v0 + OBJC_IVAR___CHSpotlightReindexManager_userDefaults) stringForKey:@"CHSpotlightIndexLocale"];
  if (!v5) {
    return [self setCallsNeedsDeferredReindexingForReason:8];
  }
  uint64_t v6 = v5;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  static Locale.current.getter();
  uint64_t v10 = Locale.identifier.getter();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if (v10 != v7 || v12 != v9)
  {
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    id result = (id)swift_bridgeObjectRelease();
    if (v14) {
      return result;
    }
    return [self setCallsNeedsDeferredReindexingForReason:8];
  }
  return (id)swift_bridgeObjectRelease_n();
}

void sub_100029C04()
{
  id v1 = [self sharedScheduler];
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v0;
  v6[4] = sub_10002A358;
  void v6[5] = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10002A5E8;
  v6[3] = &unk_100049A48;
  long long v4 = _Block_copy(v6);
  id v5 = v0;
  swift_release();
  [v1 registerForTaskWithIdentifier:v2 usingQueue:0 launchHandler:v4];
  _Block_release(v4);
}

BOOL sub_100029D34()
{
  id v1 = *(void **)(v0 + OBJC_IVAR___CHSpotlightReindexManager_userDefaults);
  if ([v1 objectForKey:@"CHFacetimeSearchableStatus"])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10002CBE8((uint64_t)v8, &qword_100053DA8);
    id v2 = [v1 integerForKey:@"CHFacetimeSearchableStatus"];
    uint64_t v3 = self;
    unsigned int v4 = [v3 supportsFaceTimeAudioCalls];
    unsigned int v5 = [v3 supportsFaceTimeVideoCalls];
    uint64_t v6 = 2;
    if (v4) {
      uint64_t v6 = 3;
    }
    if (!v5) {
      uint64_t v6 = v4;
    }
    return v2 != (id)v6;
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    sub_10002CBE8((uint64_t)v8, &qword_100053DA8);
    return 1;
  }
}

id sub_100029E44()
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v2 = Strong;
    [Strong updateFacetimeCallsSearchableStatus];
  }
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___CHSpotlightReindexManager_userDefaults);
  unsigned int v4 = self;
  unsigned int v5 = [v4 supportsFaceTimeAudioCalls];
  unsigned int v6 = [v4 supportsFaceTimeVideoCalls];
  uint64_t v7 = 2;
  if (v5) {
    uint64_t v7 = 3;
  }
  if (v6) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v5;
  }
  return [v3 setInteger:v8 forKey:@"CHFacetimeSearchableStatus"];
}

uint64_t sub_100029F34()
{
  uint64_t v0 = self;
  unsigned int v1 = [v0 supportsFaceTimeAudioCalls];
  unsigned int v2 = [v0 supportsFaceTimeVideoCalls];
  uint64_t v3 = 2;
  if (v1) {
    uint64_t v3 = 3;
  }
  if (v2) {
    return v3;
  }
  else {
    return v1;
  }
}

uint64_t sub_100029FA0()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100029FD8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unsigned int v1 = (void *)Strong;
    sub_1000298C8();
  }
}

uint64_t sub_10002A02C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002A03C()
{
  return swift_release();
}

void sub_10002A0D4(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_10002A194()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void sub_10002A1C8()
{
}

id sub_10002A228()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10002A320()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002A358(void *a1)
{
  objc_super v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    unsigned int v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Starting background indexing task", v4, 2u);
    swift_slowDealloc();
  }

  return sub_10002A410(a1);
}

uint64_t sub_10002A410(void *a1)
{
  sub_10002A650(&qword_100053DB0);
  __chkstk_darwin();
  unsigned int v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  id v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  void v6[5] = a1;
  id v7 = v1;
  id v8 = a1;
  uint64_t v9 = sub_10002B8E8((uint64_t)v4, (uint64_t)&unk_100053DC0, (uint64_t)v6);
  uint64_t v10 = (void *)swift_allocObject();
  _DWORD v10[2] = v7;
  v10[3] = v8;
  v10[4] = v9;
  aBlock[4] = sub_10002BADC;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002BC64;
  aBlock[3] = &unk_100049AC0;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v7;
  id v13 = v8;
  swift_retain();
  swift_release();
  [v13 setExpirationHandler:v11];
  _Block_release(v11);
  return swift_release();
}

void sub_10002A5E8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10002A650(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10002A694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 24) = a4;
  *(void *)(v5 + 32) = a5;
  return _swift_task_switch(sub_10002A6B4, 0, 0);
}

uint64_t sub_10002A6B4()
{
  *(unsigned char *)(v0 + 4_Block_object_dispose(&location, 8) = 0;
  if (static Task<>.isCancelled.getter())
  {
    id v1 = *(id *)(v0 + 32);
    objc_super v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v5 = *(NSObject **)(v0 + 32);
    if (v4)
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)id v6 = 138412290;
      *(void *)(v0 + 16) = v5;
      id v7 = v5;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v11 = v5;

      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Background indexing task %@ was cancelled before we could index all calls", v6, 0xCu);
      sub_10002A650(&qword_100053E10);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      objc_super v2 = v5;
    }

    sub_10002AC3C((unsigned char *)(v0 + 48), *(void *)(v0 + 24), *(id *)(v0 + 32));
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  else
  {
    id v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 40) = v8;
    void *v8 = v0;
    v8[1] = sub_10002A8EC;
    return sub_10002AFF0();
  }
}

uint64_t sub_10002A8EC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10002A9E8, 0, 0);
}

uint64_t sub_10002A9E8()
{
  *(unsigned char *)(v0 + 4_Block_object_dispose(&location, 8) = 1;
  sub_10002AC3C((unsigned char *)(v0 + 48), *(void *)(v0 + 24), *(id *)(v0 + 32));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002AA54()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002AA9C()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + _Block_object_dispose(&location, 8) = sub_10002AB48;
  *(_OWORD *)(v2 + 24) = v3;
  return _swift_task_switch(sub_10002A6B4, 0, 0);
}

uint64_t sub_10002AB48()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_10002AC3C(unsigned char *a1, int a2, id a3)
{
  if (*a1 == 1)
  {
    id v4 = a3;
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      id v8 = (void *)swift_slowAlloc();
      *(_DWORD *)id v7 = 138412290;
      id v19 = v4;
      id v9 = v4;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v8 = v4;

      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Setting %@ completed", v7, 0xCu);
      sub_10002A650(&qword_100053E10);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return [v4 setTaskCompleted];
  }
  else
  {
    id v19 = 0;
    unsigned int v10 = [a3 setTaskExpiredWithRetryAfter:&v19 error:300.0];
    id v11 = v19;
    if (v10)
    {
      return v11;
    }
    else
    {
      id v13 = v19;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      swift_errorRetain();
      swift_errorRetain();
      char v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        id v19 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136315138;
        swift_errorRetain();
        sub_10002A650(&qword_100053E28);
        uint64_t v17 = String.init<A>(describing:)();
        sub_10002CD34(v17, v18, (uint64_t *)&v19);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to expire background system task to for spotlight indexing with error: %s", v16, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
      }
      [a3 setTaskCompleted];
      return (id)swift_errorRelease();
    }
  }
}

uint64_t sub_10002AFF0()
{
  v1[7] = v0;
  uint64_t v2 = type metadata accessor for Locale();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for Date();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_10002B11C, 0, 0);
}

uint64_t sub_10002B11C()
{
  if (![*(id *)(*(void *)(v0 + 56) + OBJC_IVAR___CHSpotlightReindexManager_featureFlags) callHistorySearchEnabled])goto LABEL_6; {
  *(void *)(v0 + 120) = OBJC_IVAR___CHSpotlightReindexManager_logger;
  }
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Checking if we need to index", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = self;
  *(void *)(v0 + 12_Block_object_dispose(&location, 8) = v4;
  unsigned int v5 = [v4 shouldReindexCallsDueToDeferredReindexing];
  *(unsigned char *)(v0 + 144) = v5;
  unsigned __int8 v6 = [v4 shouldReindexCallsDueToVersionMismatch];
  *(unsigned char *)(v0 + 145) = v6;
  if ((v6 & 1) != 0 || v5)
  {
    Date.init()();
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Deferred indexing is needed, starting to index all calls", v11, 2u);
      swift_slowDealloc();
    }

    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v12;
    void *v12 = v0;
    v12[1] = sub_10002B378;
    v12[15] = *(void *)(v0 + 56);
    return _swift_task_switch(sub_10002BCC8, 0, 0);
  }
  else
  {
LABEL_6:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_10002B378()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10002B474, 0, 0);
}

uint64_t sub_10002B474()
{
  uint64_t v1 = (void *)(v0 + 56);
  unint64_t v2 = (unint64_t)[*(id *)(*(void *)(v0 + 56) + OBJC_IVAR___CHSpotlightReindexManager_userDefaults) integerForKey:@"CHSpotlightReindexingReasonKey"];
  if ((v2 & 0x8000000000000000) != 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    unint64_t v3 = v2;
    *(void *)(v0 + 40) = v2;
    id v4 = self;
    unsigned int v5 = [v4 shouldReindexCallsDueToVersionMismatch];
    if ((v3 & 2) == 0 && v5)
    {
      v3 |= 2uLL;
      *(void *)(v0 + 40) = v3;
    }
    unsigned __int8 v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v8 = 134217984;
      *(void *)(v0 + 4_Block_object_dispose(&location, 8) = v3;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Finished Reindexing calls for reasons: %lu", v8, 0xCu);
      swift_slowDealloc();
    }

    int v9 = *(unsigned __int8 *)(v0 + 145);
    swift_beginAccess();
    uint64_t v10 = *(void *)(v0 + 40);
    Date.timeIntervalSinceNow.getter();
    [v4 logEventReindexingFinishedForReason:v10 timeTaken:-v11];
    if (v9 == 1) {
      [*(id *)(*v1 + OBJC_IVAR___CHSpotlightReindexManager_userDefaults) setInteger:9 forKey:@"kCHSpotlightIndexVersion"];
    }
    if (*(unsigned char *)(v0 + 144) == 1) {
      [*(id *)(*v1 + OBJC_IVAR___CHSpotlightReindexManager_userDefaults) setInteger:0 forKey:@"CHSpotlightReindexingReasonKey"];
    }
    uint64_t v13 = *(void *)(v0 + 96);
    uint64_t v12 = *(void *)(v0 + 104);
    uint64_t v14 = *(void *)(v0 + 80);
    uint64_t v15 = *(void *)(v0 + 88);
    uint64_t v16 = *(void *)(v0 + 64);
    uint64_t v17 = *(void *)(v0 + 72);
    unint64_t v18 = *(void **)(*(void *)(v0 + 56) + OBJC_IVAR___CHSpotlightReindexManager_userDefaults);
    static Locale.current.getter();
    Locale.identifier.getter();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v14, v16);
    NSString v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v18 setObject:v19 forKey:@"CHSpotlightIndexLocale"];

    Date.init()();
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    long long v21 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v21(v12, v15);
    [v18 setObject:isa forKey:@"CHLastReindexCompletionDate"];

    long long v22 = self;
    unsigned int v23 = [v22 supportsFaceTimeAudioCalls];
    unsigned int v24 = [v22 supportsFaceTimeVideoCalls];
    uint64_t v25 = 2;
    if (v23) {
      uint64_t v25 = 3;
    }
    if (v24) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = v23;
    }
    [v18 setInteger:v26 forKey:@"CHFacetimeSearchableStatus"];
    if (static Task<>.isCancelled.getter())
    {
      uint64_t v27 = Logger.logObject.getter();
      os_log_type_t v28 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v27, v28))
      {
        id v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Background indexing task was cancelled before we could index all calls. Setting reindexingReason to IncompleteIndexing", v29, 2u);
        swift_slowDealloc();
      }
      objc_super v30 = *(void **)(v0 + 128);

      [v30 setCallsNeedsDeferredReindexingForReason:256];
    }
    v21(*(void *)(v0 + 112), *(void *)(v0 + 88));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31();
  }
  return result;
}

uint64_t sub_10002B8E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10002CBE8(a1, &qword_100053DB0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10002BA94()
{
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

void sub_10002BADC()
{
  id v1 = *(id *)(v0 + 24);
  unint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    unsigned int v5 = (void *)swift_slowAlloc();
    *(_DWORD *)id v4 = 138412290;
    id v6 = v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v5 = v1;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Background indexing task %@ expired", v4, 0xCu);
    sub_10002A650(&qword_100053E10);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  Task.cancel()();
}

uint64_t sub_10002BC64(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_10002BCA8()
{
  *(void *)(v1 + 120) = v0;
  return _swift_task_switch(sub_10002BCC8, 0, 0);
}

uint64_t sub_10002BCC8()
{
  if ([*(id *)(*(void *)(v0 + 120) + OBJC_IVAR___CHSpotlightReindexManager_featureFlags) callHistorySearchEnabled])
  {
    uint64_t v1 = static Task<>.isCancelled.getter();
    if ((v1 & 1) == 0)
    {
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)(v0 + 120);
      uint64_t v7 = OBJC_IVAR___CHSpotlightReindexManager_callHistoryManager;
      uint64_t v8 = OBJC_IVAR___CHSpotlightReindexManager_spotlightIndexManager;
      *(void *)(v0 + 12_Block_object_dispose(&location, 8) = OBJC_IVAR___CHSpotlightReindexManager_logger;
      *(void *)(v0 + 136) = v8;
      *(void *)(v0 + 144) = *(void *)(v6 + v7);
      do
      {
        *(void *)(v0 + 152) = v5;
        if (v5 == 0x147AE147AE147AFLL)
        {
          __break(1u);
          return _swift_continuation_await(v1);
        }
        Class isa = (Class)[*(id *)(v0 + 144) callsWithPredicate:0 limit:100 offset:100 * v5 batchSize:0];
        if (!isa)
        {
          sub_10002C8F8(0, &qword_100053DD8);
          static Array._unconditionallyBridgeFromObjectiveC(_:)();
          Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
        }
        *(void *)(v0 + 160) = isa;
        sub_10002C8F8(0, &qword_100053DD8);
        unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v11 = v10;
        unint64_t v12 = v10 >> 62;
        if (v10 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (!v18)
          {
LABEL_21:

            swift_bridgeObjectRelease();
            NSString v19 = Logger.logObject.getter();
            os_log_type_t v20 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v19, v20))
            {
              long long v21 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)long long v21 = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, v20, "No calls to index", v21, 2u);
              swift_slowDealloc();
            }

            uint64_t Strong = swift_unknownObjectWeakLoadStrong();
            if (Strong)
            {
              uint64_t v2 = Strong;
              [Strong updateCurrentHistoryToken];
              goto LABEL_25;
            }
            goto LABEL_26;
          }
        }
        else if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          goto LABEL_21;
        }
        swift_bridgeObjectRetain();
        uint64_t v13 = Logger.logObject.getter();
        os_log_type_t v14 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = swift_slowAlloc();
          *(_DWORD *)uint64_t v15 = 134217984;
          if (v12)
          {
            swift_bridgeObjectRetain();
            uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v16 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          *(void *)(v15 + 4) = v16;
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "Indexing %ld calls", (uint8_t *)v15, 0xCu);
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        uint64_t v17 = swift_unknownObjectWeakLoadStrong();
        *(void *)(v0 + 16_Block_object_dispose(&location, 8) = v17;
        if (v17)
        {
          uint64_t v25 = (void *)v17;
          *(void *)(v0 + 16) = v0;
          *(void *)(v0 + 24) = sub_10002C1A0;
          uint64_t v26 = swift_continuation_init();
          *(void *)(v0 + 80) = _NSConcreteStackBlock;
          *(void *)(v0 + 8_Block_object_dispose(&location, 8) = 0x40000000;
          *(void *)(v0 + 96) = sub_10002C71C;
          *(void *)(v0 + 104) = &unk_100049AE8;
          *(void *)(v0 + 112) = v26;
          [v25 indexInsertedCallsSync:isa completion:v0 + 80];
          uint64_t v1 = v0 + 16;
          return _swift_continuation_await(v1);
        }

        uint64_t v5 = *(void *)(v0 + 152) + 1;
        uint64_t v1 = static Task<>.isCancelled.getter();
      }
      while ((v1 & 1) == 0);
    }
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Background indexing task was cancelled before we could index all calls", v4, 2u);
      swift_slowDealloc();
    }
LABEL_25:
  }
LABEL_26:
  unsigned int v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_10002C1A0()
{
  return _swift_task_switch(sub_10002C280, 0, 0);
}

uint64_t sub_10002C280()
{
  uint64_t v1 = *(void **)(v0 + 160);

  uint64_t v2 = *(void *)(v0 + 152);
  for (uint64_t i = static Task<>.isCancelled.getter(); (i & 1) == 0; uint64_t i = static Task<>.isCancelled.getter())
  {
    *(void *)(v0 + 152) = v2 + 1;
    if (v2 == 0x147AE147AE147AELL)
    {
      __break(1u);
      return _swift_continuation_await(i);
    }
    Class isa = (Class)[*(id *)(v0 + 144) callsWithPredicate:0 limit:100 offset:100 * (v2 + 1) batchSize:0];
    if (!isa)
    {
      sub_10002C8F8(0, &qword_100053DD8);
      static Array._unconditionallyBridgeFromObjectiveC(_:)();
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    *(void *)(v0 + 160) = isa;
    sub_10002C8F8(0, &qword_100053DD8);
    unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v9 = v8;
    unint64_t v10 = v8 >> 62;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v16)
      {
LABEL_19:

        swift_bridgeObjectRelease();
        uint64_t v17 = Logger.logObject.getter();
        os_log_type_t v18 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v17, v18))
        {
          NSString v19 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)NSString v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "No calls to index", v19, 2u);
          swift_slowDealloc();
        }

        uint64_t Strong = swift_unknownObjectWeakLoadStrong();
        if (Strong)
        {
          id v4 = Strong;
          [Strong updateCurrentHistoryToken];
          goto LABEL_23;
        }
        goto LABEL_24;
      }
    }
    else if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_19;
    }
    swift_bridgeObjectRetain();
    unint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 134217984;
      if (v10)
      {
        swift_bridgeObjectRetain();
        uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v14 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      *(void *)(v13 + 4) = v14;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Indexing %ld calls", (uint8_t *)v13, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v15 = swift_unknownObjectWeakLoadStrong();
    *(void *)(v0 + 16_Block_object_dispose(&location, 8) = v15;
    if (v15)
    {
      unsigned int v23 = (void *)v15;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 24) = sub_10002C1A0;
      uint64_t v24 = swift_continuation_init();
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 8_Block_object_dispose(&location, 8) = 0x40000000;
      *(void *)(v0 + 96) = sub_10002C71C;
      *(void *)(v0 + 104) = &unk_100049AE8;
      *(void *)(v0 + 112) = v24;
      [v23 indexInsertedCallsSync:isa completion:v0 + 80];
      uint64_t i = v0 + 16;
      return _swift_continuation_await(i);
    }

    uint64_t v2 = *(void *)(v0 + 152);
  }
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Background indexing task was cancelled before we could index all calls", v6, 2u);
    swift_slowDealloc();
  }
LABEL_23:

LABEL_24:
  long long v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_10002C71C(uint64_t a1)
{
  return _swift_continuation_resume(*(void *)(a1 + 32));
}

uint64_t sub_10002C724(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10002C800;
  return v6(a1);
}

uint64_t sub_10002C800()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002C8F8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10002C934()
{
  return type metadata accessor for SpotlightReindexManager();
}

uint64_t type metadata accessor for SpotlightReindexManager()
{
  uint64_t result = qword_100053E98;
  if (!qword_100053E98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002C988()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_10002CA44(uint64_t a1)
{
  if (a1 >= 1)
  {
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 134283521;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Updating Index for phoneNumber: %{private}lld", v4, 0xCu);
      swift_slowDealloc();
    }

    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v6 = (void *)Strong;
      sub_10002A650(&qword_100053E08);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_100037BA0;
      id v8 = [self lastFourDigitsFrom:a1];
      if (v8)
      {
        unint64_t v9 = v8;
        uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v12 = v11;

        *(void *)(v7 + 32) = v10;
        *(void *)(v7 + 40) = v12;
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v6 updateCallsHavingHandles:isa orContactIdentifier:0];
      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_10002CBE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10002A650(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002CC44()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CC7C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10002AB48;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100053E18 + dword_100053E18);
  return v6(a1, v4);
}

uint64_t sub_10002CD34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002CE08(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10002D014((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10002D014((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10002CFC4((uint64_t)v12);
  return v7;
}

uint64_t sub_10002CE08(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10002D070(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10002CFC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10002D014(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10002D070(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002D108(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002D2E8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002D2E8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002D108(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10002D280(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10002D280(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10002A650(&qword_100053E30);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  void v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10002D2E8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10002A650(&qword_100053E30);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10002D458(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Prune operation failed with error %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10002D4D0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 container];
  sub_10000982C();
  sub_1000097F4((void *)&_mh_execute_header, a2, v4, "Could not obtain identifier from container %{public}@", v5);
}

void sub_10002D55C(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_100009864();
  sub_10000980C((void *)&_mh_execute_header, v1, v2, "Failed to unarchive the specified data %{public}@ %{public}@", (void)v3, DWORD2(v3));
}

void sub_10002D5CC(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_100009864();
  sub_10000980C((void *)&_mh_execute_header, v1, v2, "Failed to archive the specified server change token %{public}@ %{public}@", (void)v3, DWORD2(v3));
}

void sub_10002D63C()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "iCloud sync will be disabled; attempt to retrieve account information failed with error %{public}@.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10002D6A4()
{
  sub_100009874(__stack_chk_guard);
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Could not determine account status due to error %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002D710(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 userInfo];
  uint64_t v4 = [v3 objectForKey:CKPartialErrorsByItemIDKey];
  sub_10000982C();
  sub_1000097F4((void *)&_mh_execute_header, a2, v5, "Partial failure fetching record changes: %{public}@", v6);
}

void sub_10002D7C0()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Failed to create transaction record zone %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002D828(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 userInfo];
  int v6 = 138543618;
  int64_t v7 = v3;
  __int16 v8 = 2114;
  int64_t v9 = v4;
  sub_100009838((void *)&_mh_execute_header, a2, v5, "Could not finish fetch record changes operation: %{public}@ %{public}@", (uint8_t *)&v6);
}

void sub_10002D8D4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 recordID];
  v5[0] = 138543618;
  sub_100009850();
  sub_100009838((void *)&_mh_execute_header, a2, v4, "Missing value for required key %{public}@ in record %{public}@", (uint8_t *)v5);
}

void sub_10002D96C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 recordID];
  v5[0] = 138543618;
  sub_100009850();
  sub_100009838((void *)&_mh_execute_header, a2, v4, "Missing value for required key %{public}@ in record %{public}@", (uint8_t *)v5);
}

void sub_10002DA04()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Archiving call object failed with error %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002DA6C(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_100009864();
  sub_10000980C((void *)&_mh_execute_header, v1, v2, "Failed to archive the specified recent call: %{public}@ %{public}@", (void)v3, DWORD2(v3));
}

void sub_10002DADC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DB4C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unhandled partial failure type", v1, 2u);
}

void sub_10002DB90(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DC00()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Could not unarchive call from transaction %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002DC68()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Cancelling transaction record creation; could not serialize call %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10002DCD0()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Cancelling transaction record creation; call is from a third-party service provider %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10002DD38()
{
  v2[0] = 138543618;
  sub_100009850();
  sub_100009838((void *)&_mh_execute_header, v0, v1, "Missing value for required key %{public}@ in record %{public}@", (uint8_t *)v2);
}

void sub_10002DDB0()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Could not create call object from data in record %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002DE18()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Could not obtain identifier from call %@", v2, v3, v4, v5, v6);
}

void sub_10002DE80()
{
  v2[0] = 138543618;
  sub_100009850();
  sub_100009838((void *)&_mh_execute_header, v0, v1, "Missing value for required key %{public}@ in record %{public}@", (uint8_t *)v2);
}

void sub_10002DEF8()
{
  sub_100009874(__stack_chk_guard);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  sub_100009864();
  sub_10000980C((void *)&_mh_execute_header, v1, v2, "Fetching record zone with identifier %{public}@ failed with error %{public}@", (void)v3, DWORD2(v3));
}

void sub_10002DF68()
{
  sub_100009874(__stack_chk_guard);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  sub_100009864();
  sub_10000980C((void *)&_mh_execute_header, v1, v2, "Request to create record zone with identifier %{public}@ failed with error %{public}@", (void)v3, DWORD2(v3));
}

void sub_10002DFD8()
{
  sub_100009874(__stack_chk_guard);
  int v3 = 138543618;
  CFStringRef v4 = @"CallHistorySubscription";
  __int16 v5 = 2114;
  uint64_t v6 = v0;
  sub_100009838((void *)&_mh_execute_header, v1, v2, "Could not modify %{public}@ subscription: %{public}@", (uint8_t *)&v3);
}

void sub_10002E05C(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Reached retry limit of %d, bailing out", (uint8_t *)v1, 8u);
}

void sub_10002E0DC(void *a1)
{
  uint64_t v1 = [a1 device];
  uint64_t v2 = [v1 uniqueIDOverride];
  sub_10000982C();
  sub_10000B21C((void *)&_mh_execute_header, v3, v4, "Error sending to %{public}@", v5, v6, v7, v8, v9);
}

void sub_10002E178(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 device];
  uint64_t v6 = [v5 uniqueIDOverride];
  sub_10000B23C();
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error sending to %{public}@: %{public}@", v7, 0x16u);
}

void sub_10002E22C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to obtain Gizmo software version.", v1, 2u);
}

void sub_10002E270(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to split Gizmo software version into major and minor version components.", v1, 2u);
}

void sub_10002E2B4(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not get data store location: %hhu", (uint8_t *)v3, 8u);
}

void sub_10002E330()
{
  sub_10000982C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to send bootstrap database: %{public}@", v1, 0xCu);
}

void sub_10002E3A4()
{
  sub_10000982C();
  __int16 v2 = 2048;
  uint64_t v3 = 5;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not migrate temporary data store %{public}@ to schema version %ld", v1, 0x16u);
}

void sub_10002E428()
{
  sub_10000B23C();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to copy data store from %{public}@ to %{public}@", v2, 0x16u);
}

void sub_10002E4A4(void *a1)
{
  os_log_t v1 = [a1 device];
  __int16 v2 = [v1 uniqueIDOverride];
  sub_10000982C();
  sub_10000B21C((void *)&_mh_execute_header, v3, v4, "Client attempted to send bootstrap datastore to device %{public}@", v5, v6, v7, v8, v9);
}

void sub_10002E540()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Database save attempt failed with error %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002E5A8()
{
  sub_10000DE98();
  sub_10000980C((void *)&_mh_execute_header, v0, v1, "Attempt to unarchive call from transaction %{public}@ failed with error %{public}@");
}

void sub_10002E610()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Attempting to execute a batch delete action on transaction %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002E678()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Attempting to execute a delete action on transaction %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002E6E0()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Attempting to execute a insert action on transaction %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002E748()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Attempting to execute a update action on transaction %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002E7B0()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Failed to create a recent call record due to an error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002E818(os_log_t log)
{
  int v1 = 138543362;
  CFStringRef v2 = @"kCallHistoryRemoteTransactionsAppliedNotification";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing notification dictionary in %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_10002E8A0(uint64_t a1, NSObject *a2)
{
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  id v7 = (id)objc_opt_class();
  id v3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Expected %{public}@ key to be of type %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_10002E950(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Data store maintenance could not remove calls; operation failed with error %{public}@",
    (uint8_t *)&v2,
    0xCu);
}

void sub_10002E9C8(NSObject *a1)
{
  int v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Could not ignore SIGTERM: %s", (uint8_t *)&v4, 0xCu);
}

void sub_10002EA5C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Wakeup successfully scheduled", v1, 2u);
}

void sub_10002EAA0(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v3 = sub_100025E00(a1);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unhandled SyncSource: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_10002EB3C(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to unarchive the call object reason: %{public}@ exception name: %{public}@", buf, 0x16u);
}

void sub_10002EBAC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing entitlement for new connection", v1, 2u);
}

void sub_10002EBF0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 userInfo];
  int v4 = [v3 objectForKeyedSubscript:@"ck"];
  int v5 = 138412290;
  __int16 v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);
}

void sub_10002ECA8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ignoring call with nil uniqueId", buf, 2u);
}

void sub_10002ECE8()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Error indexing calls to Spotlight: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002ED50()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Error deleting calls from Spotlight: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002EDB8(void *a1)
{
  [a1 count];
  sub_10000982C();
  sub_10000B21C((void *)&_mh_execute_header, v1, v2, "No calls found for %lu items", v3, v4, v5, v6, v7);
}

void sub_10002EE30()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Contact fetch for me contact failed with the following error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002EE98()
{
  sub_10000982C();
  sub_1000097D8((void *)&_mh_execute_header, v0, v1, "Error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002EF00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EF38(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "no device uuids", v1, 2u);
}

void sub_10002EF7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EFF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F06C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F0D8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F144(uint64_t a1, unsigned int *a2, NSObject *a3)
{
  uint64_t v5 = sub_100020970(*a2);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2082;
  uint8_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Received incoming resource at URL %{public}@ when configured as %{public}s", (uint8_t *)&v6, 0x16u);
}

void sub_10002F1E4(id *a1)
{
  uint64_t v1 = [*a1 path];
  sub_10000982C();
  sub_10000B21C((void *)&_mh_execute_header, v2, v3, "Could not create transaction log at %{public}@", v4, v5, v6, v7, v8);
}

void sub_10002F26C(id *a1)
{
  uint64_t v1 = [*a1 defaultLogDirectory];
  sub_10000982C();
  sub_10000B21C((void *)&_mh_execute_header, v2, v3, "Could not create transaction log directory at %{public}@", v4, v5, v6, v7, v8);
}

void sub_10002F2F4(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_10000982C();
  sub_10000B21C((void *)&_mh_execute_header, v2, v3, "Could not open file handle for %{public}@", v4, v5, v6, v7, v8);
}

void sub_10002F378()
{
  sub_10000982C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not read transaction log: %{public}@", v1, 0xCu);
}

void sub_10002F3EC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not get NSFileSize of old transaction log %{public}@: %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_10002F470()
{
  sub_10000DE98();
  sub_10000980C((void *)&_mh_execute_header, v0, v1, "Could not remove old transaction log %{public}@: %{public}@");
}

void sub_10002F4D8()
{
  sub_10000DE98();
  sub_10000980C((void *)&_mh_execute_header, v0, v1, "Could not open %{public}@: %{public}@");
}

void sub_10002F540()
{
  sub_10000DE98();
  sub_10000980C((void *)&_mh_execute_header, v0, v1, "Could not get attributes of old transaction log %{public}@: %{public}@");
}

void sub_10002F5A8()
{
  sub_10000982C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not append transaction: %{public}@", v1, 0xCu);
}

void sub_10002F61C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot create intent for unknown call provider", v1, 2u);
}

uint64_t sub_10002F660()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_10002F684(v0);
}

void sub_10002F684(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not fetch contacts: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10002F6FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not donate interaction for call with identifier %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_10002F788(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5 = [*(id *)(a1 + 32) count];
  int v6 = 134218242;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Deleting interaction for %lu calls failed: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10002F828()
{
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return static Task<>.isCancelled.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CHSchemaGetCurrentVersion()
{
  return _CHSchemaGetCurrentVersion();
}

uint64_t CKStringFromAccountStatus()
{
  return _CKStringFromAccountStatus();
}

uint64_t CPCancelWakeAtDateWithIdentifier()
{
  return _CPCancelWakeAtDateWithIdentifier();
}

uint64_t CPScheduleWakeAtDateWithIdentifier()
{
  return _CPScheduleWakeAtDateWithIdentifier();
}

uint64_t DeserializeTransactions()
{
  return _DeserializeTransactions();
}

uint64_t HandleInteractionsForDeserializedTransactions()
{
  return _HandleInteractionsForDeserializedTransactions();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t INPersonHandleLabelForCNLabeledValue()
{
  return _INPersonHandleLabelForCNLabeledValue();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteFloatField()
{
  return _PBDataWriterWriteFloatField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint64_t createDirectoryAtPath()
{
  return _createDirectoryAtPath();
}

uint64_t ct_green_tea_logger_create_static()
{
  return _ct_green_tea_logger_create_static();
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return _getCTGreenTeaOsLogHandle();
}

uint64_t getMobileUserLibraryDirectoryPath()
{
  return _getMobileUserLibraryDirectoryPath();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

uint64_t maybeLogVersionInfo()
{
  return _maybeLogVersionInfo();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return _sel_isEqual(lhs, rhs);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__resetCache(void *a1, const char *a2, ...)
{
  return _[a1 _resetCache];
}

id objc_msgSend__sendBootstrapDataStoreWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendBootstrapDataStoreWithService:");
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend__setExtensionBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setExtensionBundleId:");
}

id objc_msgSend__setLaunchId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLaunchId:");
}

id objc_msgSend_aa_isManagedAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isManagedAppleID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_acceptEventVisitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptEventVisitor:");
}

id objc_msgSend_accountInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountInfoWithCompletionHandler:");
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return _[a1 accountStatus];
}

id objc_msgSend_activateCloudKit(void *a1, const char *a2, ...)
{
  return _[a1 activateCloudKit];
}

id objc_msgSend_activateDataStoreMaintenance(void *a1, const char *a2, ...)
{
  return _[a1 activateDataStoreMaintenance];
}

id objc_msgSend_activeSyncSession(void *a1, const char *a2, ...)
{
  return _[a1 activeSyncSession];
}

id objc_msgSend_addCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCalls:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addRecord_withInsertAndUpdate_withDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRecord:withInsertAndUpdate:withDelete:");
}

id objc_msgSend_addRemoteParticipantHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRemoteParticipantHandles:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appIntentsStream(void *a1, const char *a2, ...)
{
  return _[a1 appIntentsStream];
}

id objc_msgSend_append_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "append:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendTransactionSync_withFileHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendTransactionSync:withFileHandle:");
}

id objc_msgSend_apply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apply:");
}

id objc_msgSend_archivedDataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithError:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByApplyingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByApplyingSelector:");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayForKey:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributeSet(void *a1, const char *a2, ...)
{
  return _[a1 attributeSet];
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_autoAnsweredReason(void *a1, const char *a2, ...)
{
  return _[a1 autoAnsweredReason];
}

id objc_msgSend_begin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "begin:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bootstrappedDeviceUuids(void *a1, const char *a2, ...)
{
  return _[a1 bootstrappedDeviceUuids];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bytesOfDataUsed(void *a1, const char *a2, ...)
{
  return _[a1 bytesOfDataUsed];
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_callCategory(void *a1, const char *a2, ...)
{
  return _[a1 callCategory];
}

id objc_msgSend_callHistoryDBFetchLimit(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryDBFetchLimit];
}

id objc_msgSend_callHistorySearchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 callHistorySearchEnabled];
}

id objc_msgSend_callProviderManager(void *a1, const char *a2, ...)
{
  return _[a1 callProviderManager];
}

id objc_msgSend_callStatus(void *a1, const char *a2, ...)
{
  return _[a1 callStatus];
}

id objc_msgSend_callStatusAsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callStatusAsString:");
}

id objc_msgSend_callType(void *a1, const char *a2, ...)
{
  return _[a1 callType];
}

id objc_msgSend_callerId(void *a1, const char *a2, ...)
{
  return _[a1 callerId];
}

id objc_msgSend_callerName(void *a1, const char *a2, ...)
{
  return _[a1 callerName];
}

id objc_msgSend_calls(void *a1, const char *a2, ...)
{
  return _[a1 calls];
}

id objc_msgSend_callsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsAtIndex:");
}

id objc_msgSend_callsCount(void *a1, const char *a2, ...)
{
  return _[a1 callsCount];
}

id objc_msgSend_callsForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsForItems:");
}

id objc_msgSend_callsWithPredicate_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsWithPredicate:limit:offset:batchSize:");
}

id objc_msgSend_canAccessListenerInterfaceSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAccessListenerInterfaceSelector:");
}

id objc_msgSend_canWeSync(void *a1, const char *a2, ...)
{
  return _[a1 canWeSync];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancel_sync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel_sync");
}

id objc_msgSend_chHandle(void *a1, const char *a2, ...)
{
  return _[a1 chHandle];
}

id objc_msgSend_chRecentCall(void *a1, const char *a2, ...)
{
  return _[a1 chRecentCall];
}

id objc_msgSend_chRemoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 chRemoteParticipantHandles];
}

id objc_msgSend_ch_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ch_sharedAccountStore");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_checkAndSetOperationInProgress_sync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAndSetOperationInProgress_sync:");
}

id objc_msgSend_checkForBootstrapDeviceChanges(void *a1, const char *a2, ...)
{
  return _[a1 checkForBootstrapDeviceChanges];
}

id objc_msgSend_chsh_applicationBundleIdentifierOverrideForNetworkAttribution(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chsh_applicationBundleIdentifierOverrideForNetworkAttribution");
}

id objc_msgSend_chsh_secureContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chsh_secureContainer");
}

id objc_msgSend_chsh_transactionRecordWithRecordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chsh_transactionRecordWithRecordID:");
}

id objc_msgSend_chsh_transactionRecordWithZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chsh_transactionRecordWithZoneID:");
}

id objc_msgSend_chsh_transactionRecordZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chsh_transactionRecordZone");
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return _[a1 clear];
}

id objc_msgSend_clearCalls(void *a1, const char *a2, ...)
{
  return _[a1 clearCalls];
}

id objc_msgSend_clearRemoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 clearRemoteParticipantHandles];
}

id objc_msgSend_clearSync(void *a1, const char *a2, ...)
{
  return _[a1 clearSync];
}

id objc_msgSend_cloudKit(void *a1, const char *a2, ...)
{
  return _[a1 cloudKit];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsForContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsForContact:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationAggregator(void *a1, const char *a2, ...)
{
  return _[a1 configurationAggregator];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _[a1 contact];
}

id objc_msgSend_contactChangeManager(void *a1, const char *a2, ...)
{
  return _[a1 contactChangeManager];
}

id objc_msgSend_contactHandleForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactHandleForHandle:");
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 contactIdentifier];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _[a1 contactStore];
}

id objc_msgSend_contactsByContactHandleForContactHandles_keyDescriptors_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsByContactHandleForContactHandles:keyDescriptors:error:");
}

id objc_msgSend_contactsByHandleForCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsByHandleForCalls:");
}

id objc_msgSend_contactsByHandleForCalls_keyDescriptors_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsByHandleForCalls:keyDescriptors:error:");
}

id objc_msgSend_contactsByHandleForHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsByHandleForHandles:");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return _[a1 container];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return _[a1 containerID];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 containerIdentifier];
}

id objc_msgSend_containerUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 containerUserDefaults];
}

id objc_msgSend_containerUserDefaultsObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerUserDefaultsObjectForKey:");
}

id objc_msgSend_containerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerWithIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_conversationID(void *a1, const char *a2, ...)
{
  return _[a1 conversationID];
}

id objc_msgSend_coordinator(void *a1, const char *a2, ...)
{
  return _[a1 coordinator];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForFetchRequest:error:");
}

id objc_msgSend_create(void *a1, const char *a2, ...)
{
  return _[a1 create];
}

id objc_msgSend_createCallRecord_error_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createCallRecord:error:save:");
}

id objc_msgSend_createDataStore(void *a1, const char *a2, ...)
{
  return _[a1 createDataStore];
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createForServer(void *a1, const char *a2, ...)
{
  return _[a1 createForServer];
}

id objc_msgSend_createLogDirectoryAndFile(void *a1, const char *a2, ...)
{
  return _[a1 createLogDirectoryAndFile];
}

id objc_msgSend_createRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRecord:");
}

id objc_msgSend_createRecordZoneWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRecordZoneWithCompletionHandler:");
}

id objc_msgSend_csIndex(void *a1, const char *a2, ...)
{
  return _[a1 csIndex];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentHistoryToken(void *a1, const char *a2, ...)
{
  return _[a1 currentHistoryToken];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataStore(void *a1, const char *a2, ...)
{
  return _[a1 dataStore];
}

id objc_msgSend_dataStoreType(void *a1, const char *a2, ...)
{
  return _[a1 dataStoreType];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return _[a1 database];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_dbHandle(void *a1, const char *a2, ...)
{
  return _[a1 dbHandle];
}

id objc_msgSend_deactivateCloudKit(void *a1, const char *a2, ...)
{
  return _[a1 deactivateCloudKit];
}

id objc_msgSend_deactivateDataStoreMaintenance(void *a1, const char *a2, ...)
{
  return _[a1 deactivateDataStoreMaintenance];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultLogDirectory(void *a1, const char *a2, ...)
{
  return _[a1 defaultLogDirectory];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegateController(void *a1, const char *a2, ...)
{
  return _[a1 delegateController];
}

id objc_msgSend_deleteAllInteractionsWithBundleID_protectionClass_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllInteractionsWithBundleID:protectionClass:completionHandler:");
}

id objc_msgSend_deleteCallsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCallsWithIdentifiers:");
}

id objc_msgSend_deleteCallsWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCallsWithPredicate:");
}

id objc_msgSend_deleteInteractionWithCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteInteractionWithCalls:");
}

id objc_msgSend_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:");
}

id objc_msgSend_deleteObjectWithUniqueId_error_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObjectWithUniqueId:error:save:");
}

id objc_msgSend_deleteRecordZoneWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecordZoneWithID:completionHandler:");
}

id objc_msgSend_deleteSearchableItemsWithIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSearchableItemsWithIdentifiers:completionHandler:");
}

id objc_msgSend_descriptionForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForError:");
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeysForStyle:");
}

id objc_msgSend_descriptorForUsedKeys(void *a1, const char *a2, ...)
{
  return _[a1 descriptorForUsedKeys];
}

id objc_msgSend_destroyDBAtLocation_withModelAtLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyDBAtLocation:withModelAtLocation:");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_devicesChanged_shouldRemoveUnregisteredDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicesChanged:shouldRemoveUnregisteredDevices:");
}

id objc_msgSend_dialRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialRequestForRecentCall:");
}

id objc_msgSend_dialRequestURLForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialRequestURLForRecentCall:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disconnectedCause(void *a1, const char *a2, ...)
{
  return _[a1 disconnectedCause];
}

id objc_msgSend_doesCall_matchWith_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesCall:matchWith:");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_donateCallHistoryInteractionWithCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateCallHistoryInteractionWithCall:");
}

id objc_msgSend_donateInteractionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateInteractionWithCompletion:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downgradeDatabaseAtLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downgradeDatabaseAtLocation:");
}

id objc_msgSend_downgradeDatabaseAtLocation_toVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downgradeDatabaseAtLocation:toVersion:");
}

id objc_msgSend_downloadChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadChanges:");
}

id objc_msgSend_downloadChanges_sync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadChanges_sync");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return _[a1 emailAddresses];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _[a1 encodedData];
}

id objc_msgSend_encryptedValuesByKey(void *a1, const char *a2, ...)
{
  return _[a1 encryptedValuesByKey];
}

id objc_msgSend_enumerateDelegatesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateDelegatesUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return _[a1 errorCode];
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "execute:");
}

id objc_msgSend_executeDeleteTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeDeleteTransaction:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_executeInsertTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeInsertTransaction:");
}

id objc_msgSend_executeSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeSync:");
}

id objc_msgSend_executeSyncWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeSyncWithResult:");
}

id objc_msgSend_executeUpdateTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeUpdateTransaction:");
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_fetchAllObjectsWithUniqueId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAllObjectsWithUniqueId:");
}

id objc_msgSend_fetchAttributesForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAttributesForCall:");
}

id objc_msgSend_fetchCallIdentifiersWithPredicate_sortDescriptors_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCallIdentifiersWithPredicate:sortDescriptors:limit:offset:batchSize:");
}

id objc_msgSend_fetchCallMediaTypeForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCallMediaTypeForCall:");
}

id objc_msgSend_fetchCallProviderForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCallProviderForCall:");
}

id objc_msgSend_fetchCallStatusForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCallStatusForCall:");
}

id objc_msgSend_fetchContactsAfterDelay(void *a1, const char *a2, ...)
{
  return _[a1 fetchContactsAfterDelay];
}

id objc_msgSend_fetchLocalisedCallStatusForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLocalisedCallStatusForCall:");
}

id objc_msgSend_fetchObjectWithUniqueId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchObjectWithUniqueId:");
}

id objc_msgSend_fetchRecordZoneWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecordZoneWithID:completionHandler:");
}

id objc_msgSend_fetchTransactionRecordZoneWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchTransactionRecordZoneWithCompletion:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileHandleForReadingAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileHandleForReadingAtPath:");
}

id objc_msgSend_fileHandleForWritingAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileHandleForWritingAtPath:");
}

id objc_msgSend_fileOffset(void *a1, const char *a2, ...)
{
  return _[a1 fileOffset];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filterRemoteTransactions_withLocalTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterRemoteTransactions:withLocalTransactions:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return _[a1 finishDecoding];
}

id objc_msgSend_fireSyncNotification_sync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fireSyncNotification_sync");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_flushTransactionsWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flushTransactionsWithService:");
}

id objc_msgSend_formattedHandle_isoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedHandle:isoCountryCode:");
}

id objc_msgSend_formattedHandleForComponentSearch_isoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedHandleForComponentSearch:isoCountryCode:");
}

id objc_msgSend_formattedRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 formattedRepresentation];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getDBLocationIsSandboxed_isTemporary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDBLocationIsSandboxed:isTemporary:error:");
}

id objc_msgSend_getDefaultLogDirectory(void *a1, const char *a2, ...)
{
  return _[a1 getDefaultLogDirectory];
}

id objc_msgSend_getSchemaVersionToDowngradeTo(void *a1, const char *a2, ...)
{
  return _[a1 getSchemaVersionToDowngradeTo];
}

id objc_msgSend_getSomeTransactions(void *a1, const char *a2, ...)
{
  return _[a1 getSomeTransactions];
}

id objc_msgSend_getSomeTransactionsSync(void *a1, const char *a2, ...)
{
  return _[a1 getSomeTransactionsSync];
}

id objc_msgSend_getSyncHistory(void *a1, const char *a2, ...)
{
  return _[a1 getSyncHistory];
}

id objc_msgSend_getTransactions(void *a1, const char *a2, ...)
{
  return _[a1 getTransactions];
}

id objc_msgSend_getUpdatesWithQualityOfService_withCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUpdatesWithQualityOfService:withCallback:");
}

id objc_msgSend_groupConversations(void *a1, const char *a2, ...)
{
  return _[a1 groupConversations];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_handleDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDelete:");
}

id objc_msgSend_handleFingerprintDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFingerprintDelete:");
}

id objc_msgSend_handleIdentifierForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIdentifierForHandle:");
}

id objc_msgSend_handleInsert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInsert:");
}

id objc_msgSend_handleInsert_withFingerprint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInsert:withFingerprint:");
}

id objc_msgSend_handleOperationComplete_sync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOperationComplete_sync");
}

id objc_msgSend_handlePartialUploadFailure_withUploadRecordsToSave_withRecordsToDelete_withRetryCount_withCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePartialUploadFailure:withUploadRecordsToSave:withRecordsToDelete:withRetryCount:withCallback:");
}

id objc_msgSend_handleRemoteTransactionsApplied_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRemoteTransactionsApplied:");
}

id objc_msgSend_handleRemoteTransactionsNotification_withChangeToken_withMoreComing_withSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRemoteTransactionsNotification:withChangeToken:withMoreComing:withSource:");
}

id objc_msgSend_handleRemoteTransactionsNotification_withSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRemoteTransactionsNotification:withSource:");
}

id objc_msgSend_handleTransactionData_withConfigurationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTransactionData:withConfigurationData:");
}

id objc_msgSend_handleType(void *a1, const char *a2, ...)
{
  return _[a1 handleType];
}

id objc_msgSend_handleTypeForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTypeForValue:");
}

id objc_msgSend_handleUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUpdate:");
}

id objc_msgSend_handleWithCHHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithCHHandle:");
}

id objc_msgSend_handleWithType_value_normalizedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithType:value:normalizedValue:");
}

id objc_msgSend_handlesIncluding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlesIncluding:");
}

id objc_msgSend_hasConversationID(void *a1, const char *a2, ...)
{
  return _[a1 hasConversationID];
}

id objc_msgSend_hasHandleType(void *a1, const char *a2, ...)
{
  return _[a1 hasHandleType];
}

id objc_msgSend_hasJunkConfidence(void *a1, const char *a2, ...)
{
  return _[a1 hasJunkConfidence];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_increaseCallHistoryEnabled(void *a1, const char *a2, ...)
{
  return _[a1 increaseCallHistoryEnabled];
}

id objc_msgSend_indexInsertedCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexInsertedCalls:");
}

id objc_msgSend_indexInsertedCallsSync_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexInsertedCallsSync:completion:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexSearchableItems_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSearchableItems:completionHandler:");
}

id objc_msgSend_indexTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexTransactions:");
}

id objc_msgSend_indexedFacetimeAudioCallsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexedFacetimeAudioCallsWithCompletion:");
}

id objc_msgSend_indexedFacetimeVideoCallsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexedFacetimeVideoCallsWithCompletion:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithAudioRoute_destinationType_preferredCallProvider_contacts_recordTypeForRedialing_ttyType_callCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAudioRoute:destinationType:preferredCallProvider:contacts:recordTypeForRedialing:ttyType:callCapability:");
}

id objc_msgSend_initWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBool:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCloudKit_withTransactionLog_withAutoSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCloudKit:withTransactionLog:withAutoSync:");
}

id objc_msgSend_initWithConfigurations_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigurations:queue:");
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerID:options:");
}

id objc_msgSend_initWithContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerIdentifier:");
}

id objc_msgSend_initWithDBHandle_interactionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDBHandle:interactionManager:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithDataProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataProviders:");
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:");
}

id objc_msgSend_initWithDataStore_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataStore:configuration:");
}

id objc_msgSend_initWithDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabase:");
}

id objc_msgSend_initWithDatabase_andInteractionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabase:andInteractionManager:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDescription:");
}

id objc_msgSend_initWithDevice_withPairedSyncCoordinator_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:withPairedSyncCoordinator:withConfiguration:");
}

id objc_msgSend_initWithDigits_isoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDigits:isoCountryCode:");
}

id objc_msgSend_initWithDisplayName_handles_handleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplayName:handles:handleIdentifier:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithFileName_withDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileName:withDescription:");
}

id objc_msgSend_initWithIndex_metadataCache_contactStore_featureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIndex:metadataCache:contactStore:featureFlags:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithIntent_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntent:response:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithKeyName_searchable_searchableByDefault_unique_multiValued_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyName:searchable:searchableByDefault:unique:multiValued:");
}

id objc_msgSend_initWithKeysToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeysToFetch:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMetadataCache_callProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetadataCache:callProviderManager:");
}

id objc_msgSend_initWithName_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:bundleIdentifier:");
}

id objc_msgSend_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_isMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:");
}

id objc_msgSend_initWithQueue_withName_withTimeout_withCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:withName:withTimeout:withCallback:");
}

id objc_msgSend_initWithRecordID_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordID:action:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordType:recordID:");
}

id objc_msgSend_initWithRecordType_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordType:zoneID:");
}

id objc_msgSend_initWithRecordZoneID_previousServerChangeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordZoneID:previousServerChangeToken:");
}

id objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordsToSave:recordIDsToDelete:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithSpotlightIndexManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpotlightIndexManager:");
}

id objc_msgSend_initWithSpotlightIndexManager_featureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpotlightIndexManager:featureFlags:");
}

id objc_msgSend_initWithString_andRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:andRecord:");
}

id objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSubscriptionsToSave:subscriptionIDsToDelete:");
}

id objc_msgSend_initWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeIntervalSince1970:");
}

id objc_msgSend_initWithType_andRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:andRecord:");
}

id objc_msgSend_initWithType_value_normalizedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:value:normalizedValue:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUniqueIdentifier_domainIdentifier_attributeSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUniqueIdentifier:domainIdentifier:attributeSet:");
}

id objc_msgSend_initWithValue_type_label_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:type:label:");
}

id objc_msgSend_initWithZoneID_subscriptionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneID:subscriptionID:");
}

id objc_msgSend_initWithZoneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneName:");
}

id objc_msgSend_initializeTransactionCountSync(void *a1, const char *a2, ...)
{
  return _[a1 initializeTransactionCountSync];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return _[a1 interaction];
}

id objc_msgSend_interactionDateInterval(void *a1, const char *a2, ...)
{
  return _[a1 interactionDateInterval];
}

id objc_msgSend_interactionManager(void *a1, const char *a2, ...)
{
  return _[a1 interactionManager];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isAccountActive(void *a1, const char *a2, ...)
{
  return _[a1 isAccountActive];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isCloudKitEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCloudKitEnabled];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultPairedDevice];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeProvider];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return _[a1 isNearby];
}

id objc_msgSend_isSessionActive(void *a1, const char *a2, ...)
{
  return _[a1 isSessionActive];
}

id objc_msgSend_isTelephonyCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTelephonyCall:");
}

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 isTelephonyProvider];
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 isoCountryCode];
}

id objc_msgSend_joinConversationRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinConversationRequestForRecentCall:");
}

id objc_msgSend_joinConversationRequestURLForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinConversationRequestURLForRecentCall:");
}

id objc_msgSend_junkConfidence(void *a1, const char *a2, ...)
{
  return _[a1 junkConfidence];
}

id objc_msgSend_keepCallsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 keepCallsEnabled];
}

id objc_msgSend_keepCallsTimeIntervalType(void *a1, const char *a2, ...)
{
  return _[a1 keepCallsTimeIntervalType];
}

id objc_msgSend_keyDescriptors(void *a1, const char *a2, ...)
{
  return _[a1 keyDescriptors];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localParticipantUUID(void *a1, const char *a2, ...)
{
  return _[a1 localParticipantUUID];
}

id objc_msgSend_localParticipantUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 localParticipantUUIDString];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:");
}

id objc_msgSend_localizedSubtitleForRecentCall_handle_contact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitleForRecentCall:handle:contact:");
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return _[a1 logHandle];
}

id objc_msgSend_logHandleForDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logHandleForDomain:");
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return _[a1 loginID];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_makeDatabaseAtURLClassCDataProtected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeDatabaseAtURLClassCDataProtected:");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_matchCallWithFingerprint_usingDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchCallWithFingerprint:usingDatabase:");
}

id objc_msgSend_mePerson(void *a1, const char *a2, ...)
{
  return _[a1 mePerson];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _[a1 mediaType];
}

id objc_msgSend_merge_withRemoteTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "merge:withRemoteTransactions:");
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_metadataCache(void *a1, const char *a2, ...)
{
  return _[a1 metadataCache];
}

id objc_msgSend_metadataDestinationIDsForCHRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataDestinationIDsForCHRecentCalls:");
}

id objc_msgSend_migrateFromKeyedArchiverSync(void *a1, const char *a2, ...)
{
  return _[a1 migrateFromKeyedArchiverSync];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _[a1 minute];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 modelIdentifier];
}

id objc_msgSend_modelURL(void *a1, const char *a2, ...)
{
  return _[a1 modelURL];
}

id objc_msgSend_moreComing(void *a1, const char *a2, ...)
{
  return _[a1 moreComing];
}

id objc_msgSend_moveCallRecordsFromDatabaseAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveCallRecordsFromDatabaseAtURL:");
}

id objc_msgSend_moveCallsFromTempDatabase(void *a1, const char *a2, ...)
{
  return _[a1 moveCallsFromTempDatabase];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_normalizedRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 normalizedRepresentation];
}

id objc_msgSend_normalizedValue(void *a1, const char *a2, ...)
{
  return _[a1 normalizedValue];
}

id objc_msgSend_notificationThreadIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 notificationThreadIdentifier];
}

id objc_msgSend_numberForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForKey:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_operationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 operationIdentifier];
}

id objc_msgSend_outgoingLocalParticipantUUID(void *a1, const char *a2, ...)
{
  return _[a1 outgoingLocalParticipantUUID];
}

id objc_msgSend_outgoingLocalParticipantUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 outgoingLocalParticipantUUIDString];
}

id objc_msgSend_parseMergeDictionary_withSyncSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseMergeDictionary:withSyncSource:");
}

id objc_msgSend_participantGroupUUID(void *a1, const char *a2, ...)
{
  return _[a1 participantGroupUUID];
}

id objc_msgSend_participantGroupUUIDString(void *a1, const char *a2, ...)
{
  return _[a1 participantGroupUUIDString];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pendingTransactions(void *a1, const char *a2, ...)
{
  return _[a1 pendingTransactions];
}

id objc_msgSend_persistedDeviceListKey(void *a1, const char *a2, ...)
{
  return _[a1 persistedDeviceListKey];
}

id objc_msgSend_personForHandle_isoCountryCode_contact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personForHandle:isoCountryCode:contact:");
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumbers];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predicateForCallsLessThanDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsLessThanDate:");
}

id objc_msgSend_predicateForCallsWithAnyUniqueIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsWithAnyUniqueIDs:");
}

id objc_msgSend_predicateForMeContact(void *a1, const char *a2, ...)
{
  return _[a1 predicateForMeContact];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_previousServerChangeToken(void *a1, const char *a2, ...)
{
  return _[a1 previousServerChangeToken];
}

id objc_msgSend_previousServerChangeTokenData(void *a1, const char *a2, ...)
{
  return _[a1 previousServerChangeTokenData];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return _[a1 privateCloudDatabase];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processingNotification(void *a1, const char *a2, ...)
{
  return _[a1 processingNotification];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_protoRecentCallWithRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protoRecentCallWithRecentCall:");
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerForRecentCall:");
}

id objc_msgSend_prune(void *a1, const char *a2, ...)
{
  return _[a1 prune];
}

id objc_msgSend_pruneCallsWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pruneCallsWithPredicate:");
}

id objc_msgSend_pruneSync(void *a1, const char *a2, ...)
{
  return _[a1 pruneSync];
}

id objc_msgSend_queryAccountStatus(void *a1, const char *a2, ...)
{
  return _[a1 queryAccountStatus];
}

id objc_msgSend_queryAccountStatusWithRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryAccountStatusWithRetryCount:");
}

id objc_msgSend_queryContext(void *a1, const char *a2, ...)
{
  return _[a1 queryContext];
}

id objc_msgSend_querySpotlightCountWithSearchString_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "querySpotlightCountWithSearchString:completion:");
}

id objc_msgSend_querySpotlightWithSearchString_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "querySpotlightWithSearchString:completion:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_read(void *a1, const char *a2, ...)
{
  return _[a1 read];
}

id objc_msgSend_readDataOfLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDataOfLength:");
}

id objc_msgSend_readFileOffset(void *a1, const char *a2, ...)
{
  return _[a1 readFileOffset];
}

id objc_msgSend_readTransactionsProcessed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readTransactionsProcessed:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_reconcileTransaction_withLocalCall_withRemoteCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconcileTransaction:withLocalCall:withRemoteCall:");
}

id objc_msgSend_record(void *a1, const char *a2, ...)
{
  return _[a1 record];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return _[a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return _[a1 recordName];
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return _[a1 recordType];
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_registerForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForNotifications];
}

id objc_msgSend_reindexItemsForContactsUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reindexItemsForContactsUpdate:");
}

id objc_msgSend_rememberBootstrappedDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rememberBootstrappedDevices:");
}

id objc_msgSend_remoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantHandles];
}

id objc_msgSend_remoteParticipantHandlesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantHandlesAtIndex:");
}

id objc_msgSend_remoteParticipantHandlesCount(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantHandlesCount];
}

id objc_msgSend_removeCalls(void *a1, const char *a2, ...)
{
  return _[a1 removeCalls];
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDelegate:");
}

id objc_msgSend_removeDeletedCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeletedCalls:");
}

id objc_msgSend_removeDeletedCallsSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeletedCallsSync:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeOperationInProgress_sync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeOperationInProgress_sync");
}

id objc_msgSend_removeTemporaryBootstrapDataStore(void *a1, const char *a2, ...)
{
  return _[a1 removeTemporaryBootstrapDataStore];
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replacePersistentStore_withURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replacePersistentStore:withURL:");
}

id objc_msgSend_resetAllTimers(void *a1, const char *a2, ...)
{
  return _[a1 resetAllTimers];
}

id objc_msgSend_resolveUploadConflicts_withInsertAndUpdateRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveUploadConflicts:withInsertAndUpdateRecords:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retryCloudKitOperationForError_withRetryCount_withCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryCloudKitOperationForError:withRetryCount:withCallback:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_saveDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveDatabase:");
}

id objc_msgSend_saveRecordZone_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveRecordZone:completionHandler:");
}

id objc_msgSend_screenSharingType(void *a1, const char *a2, ...)
{
  return _[a1 screenSharingType];
}

id objc_msgSend_searchQueryWithSearchString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchQueryWithSearchString:");
}

id objc_msgSend_searchStringForCallsMatchingHandles_orContactIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchStringForCallsMatchingHandles:orContactIdentifier:");
}

id objc_msgSend_searchStringForFacetimeAudioCalls(void *a1, const char *a2, ...)
{
  return _[a1 searchStringForFacetimeAudioCalls];
}

id objc_msgSend_searchStringForFacetimeVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 searchStringForFacetimeVideoCalls];
}

id objc_msgSend_searchableIndex(void *a1, const char *a2, ...)
{
  return _[a1 searchableIndex];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _[a1 second];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return _[a1 seekToEndOfFile];
}

id objc_msgSend_seekToFileOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seekToFileOffset:");
}

id objc_msgSend_sendBootstrapDataStoreWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendBootstrapDataStoreWithService:");
}

id objc_msgSend_sendIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sendIdentifier];
}

id objc_msgSend_sendMessage_fromAccount_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendMessage_withService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:withService:");
}

id objc_msgSend_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendTransactions_withService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendTransactions:withService:");
}

id objc_msgSend_senderIdentityForAccountUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityForAccountUUID:");
}

id objc_msgSend_serializeTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializeTransaction:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceProvider(void *a1, const char *a2, ...)
{
  return _[a1 serviceProvider];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sessionIdentifier];
}

id objc_msgSend_setAccountActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountActive:");
}

id objc_msgSend_setAdditionalContactKeyDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalContactKeyDescriptors:");
}

id objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationBundleIdentifierOverrideForNetworkAttribution:");
}

id objc_msgSend_setAuthors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthors:");
}

id objc_msgSend_setAutoAnsweredReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoAnsweredReason:");
}

id objc_msgSend_setBootstrappedDeviceUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBootstrappedDeviceUuids:");
}

id objc_msgSend_setBytesOfDataUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBytesOfDataUsed:");
}

id objc_msgSend_setCallCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallCategory:");
}

id objc_msgSend_setCallDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallDuration:");
}

id objc_msgSend_setCallOccurrences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallOccurrences:");
}

id objc_msgSend_setCallProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallProviderManager:");
}

id objc_msgSend_setCallStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallStatus:");
}

id objc_msgSend_setCallType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallType:");
}

id objc_msgSend_setCallerId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerId:");
}

id objc_msgSend_setCallerIdLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerIdLocation:");
}

id objc_msgSend_setCallerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerName:");
}

id objc_msgSend_setCallsNeedsDeferredReindexingForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallsNeedsDeferredReindexingForReason:");
}

id objc_msgSend_setChRemoteParticipantHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChRemoteParticipantHandles:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setContactChangeManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactChangeManager:");
}

id objc_msgSend_setContactIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactIdentifier:");
}

id objc_msgSend_setContactStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactStore:");
}

id objc_msgSend_setContainerUserDefaultsObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerUserDefaultsObject:forKey:");
}

id objc_msgSend_setContentCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCreationDate:");
}

id objc_msgSend_setContentDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentDescription:");
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentType:");
}

id objc_msgSend_setConversationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationID:");
}

id objc_msgSend_setCountChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountChangedHandler:");
}

id objc_msgSend_setCounting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCounting:");
}

id objc_msgSend_setCsIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCsIndex:");
}

id objc_msgSend_setCurrentHistoryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentHistoryToken:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateInterval:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDevicePhoneId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevicePhoneId:");
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirection:");
}

id objc_msgSend_setDisableSearchInSpotlight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableSearchInSpotlight:");
}

id objc_msgSend_setDisconnectedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisconnectedReason:");
}

id objc_msgSend_setDiscretionaryNetworkBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionaryNetworkBehavior:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDonationMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDonationMetadata:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFetchAllChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchAllChanges:");
}

id objc_msgSend_setFetchRecordChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchRecordChangesCompletionBlock:");
}

id objc_msgSend_setFileOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFileOffset:");
}

id objc_msgSend_setFoundItemsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFoundItemsHandler:");
}

id objc_msgSend_setHandleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleType:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIntentHandlingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntentHandlingStatus:");
}

id objc_msgSend_setIsUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUpdate:");
}

id objc_msgSend_setIsoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsoCountryCode:");
}

id objc_msgSend_setJunkConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJunkConfidence:");
}

id objc_msgSend_setLastUsedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUsedDate:");
}

id objc_msgSend_setLocalParticipantHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalParticipantHandle:");
}

id objc_msgSend_setLocalParticipantUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalParticipantUUID:");
}

id objc_msgSend_setLocalParticipantUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalParticipantUUIDString:");
}

id objc_msgSend_setMetadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataCache:");
}

id objc_msgSend_setModifyRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifyRecordsCompletionBlock:");
}

id objc_msgSend_setModifySubscriptionsCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifySubscriptionsCompletionBlock:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsDeferredReindexingForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsDeferredReindexingForReason:");
}

id objc_msgSend_setNextScheduledSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextScheduledSync:");
}

id objc_msgSend_setNormalizedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNormalizedValue:");
}

id objc_msgSend_setNotificationThreadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationThreadIdentifier:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObserverCallRecordRef_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObserverCallRecordRef:");
}

id objc_msgSend_setOriginatingUIType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatingUIType:");
}

id objc_msgSend_setOsTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOsTransaction:");
}

id objc_msgSend_setOutgoingLocalParticipantUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutgoingLocalParticipantUUID:");
}

id objc_msgSend_setOutgoingLocalParticipantUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutgoingLocalParticipantUUIDString:");
}

id objc_msgSend_setParticipantGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantGroupUUID:");
}

id objc_msgSend_setParticipantGroupUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantGroupUUIDString:");
}

id objc_msgSend_setParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipants:");
}

id objc_msgSend_setPendingTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingTransactions:");
}

id objc_msgSend_setPerRecordCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerRecordCompletionBlock:");
}

id objc_msgSend_setPerRecordProgressBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerRecordProgressBlock:");
}

id objc_msgSend_setPersistedDeviceListKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistedDeviceListKey:");
}

id objc_msgSend_setPhoneCallBackURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneCallBackURL:");
}

id objc_msgSend_setPhoneCallStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneCallStatus:");
}

id objc_msgSend_setPhoneCallType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneCallType:");
}

id objc_msgSend_setPhoneNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneNumbers:");
}

id objc_msgSend_setPhoneProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneProvider:");
}

id objc_msgSend_setPhoneSIM_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneSIM:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousServerChangeToken:");
}

id objc_msgSend_setPreviousServerChangeTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousServerChangeTokenData:");
}

id objc_msgSend_setPrimaryRecipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryRecipients:");
}

id objc_msgSend_setProcessingNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessingNotification:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRead:");
}

id objc_msgSend_setRecentCallStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecentCallStatus:");
}

id objc_msgSend_setRecordChangedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordChangedBlock:");
}

id objc_msgSend_setRecordWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordWithIDWasDeletedBlock:");
}

id objc_msgSend_setRelatedAppBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelatedAppBundleIdentifier:");
}

id objc_msgSend_setRemoteParticipantHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteParticipantHandles:");
}

id objc_msgSend_setScreenSharingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenSharingType:");
}

id objc_msgSend_setSendIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendIdentifier:");
}

id objc_msgSend_setServiceProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceProvider:");
}

id objc_msgSend_setStartingToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartingToken:");
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatus:");
}

id objc_msgSend_setSupportsPhoneCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsPhoneCall:");
}

id objc_msgSend_setTimeToEstablish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeToEstablish:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTransactionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionCount:");
}

id objc_msgSend_setTransactionRecordZoneCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionRecordZoneCreationDate:");
}

id objc_msgSend_setTransactionRecordZoneFetchDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionRecordZoneFetchDate:");
}

id objc_msgSend_setTransactionRecordZoneSubscriptionCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionRecordZoneSubscriptionCreationDate:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUniqueId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueId:");
}

id objc_msgSend_setUseZoneWidePCS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseZoneWidePCS:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forCustomKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forCustomKey:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVerificationStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerificationStatus:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setYear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setYear:");
}

id objc_msgSend_setupBootstrappedDevices(void *a1, const char *a2, ...)
{
  return _[a1 setupBootstrappedDevices];
}

id objc_msgSend_setupSubscription(void *a1, const char *a2, ...)
{
  return _[a1 setupSubscription];
}

id objc_msgSend_setupSubscriptionWithRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupSubscriptionWithRetryCount:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedInstanceForBagType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstanceForBagType:");
}

id objc_msgSend_shouldCall_updateMatchingCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCall:updateMatchingCall:");
}

id objc_msgSend_sortTransactionsByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortTransactionsByType:");
}

id objc_msgSend_spotlightIndexManager(void *a1, const char *a2, ...)
{
  return _[a1 spotlightIndexManager];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startInitialSync(void *a1, const char *a2, ...)
{
  return _[a1 startInitialSync];
}

id objc_msgSend_startReunionSync(void *a1, const char *a2, ...)
{
  return _[a1 startReunionSync];
}

id objc_msgSend_startWatchDogTimer_sync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWatchDogTimer_sync");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromContact_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromContact:style:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subtitleProvider(void *a1, const char *a2, ...)
{
  return _[a1 subtitleProvider];
}

id objc_msgSend_supportsDeviceToDeviceEncryption(void *a1, const char *a2, ...)
{
  return _[a1 supportsDeviceToDeviceEncryption];
}

id objc_msgSend_supportsFaceTimeAudioCalls(void *a1, const char *a2, ...)
{
  return _[a1 supportsFaceTimeAudioCalls];
}

id objc_msgSend_supportsFaceTimeVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 supportsFaceTimeVideoCalls];
}

id objc_msgSend_syncComplete(void *a1, const char *a2, ...)
{
  return _[a1 syncComplete];
}

id objc_msgSend_syncCoordinatorWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncCoordinatorWithServiceName:");
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return _[a1 syncDidComplete];
}

id objc_msgSend_syncDidFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncDidFailWithError:");
}

id objc_msgSend_syncEngine(void *a1, const char *a2, ...)
{
  return _[a1 syncEngine];
}

id objc_msgSend_syncFailedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncFailedWithError:");
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return _[a1 syncSessionType];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronizeFile(void *a1, const char *a2, ...)
{
  return _[a1 synchronizeFile];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeToEstablish(void *a1, const char *a2, ...)
{
  return _[a1 timeToEstablish];
}

id objc_msgSend_toString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toString:");
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _[a1 transaction];
}

id objc_msgSend_transactionCount(void *a1, const char *a2, ...)
{
  return _[a1 transactionCount];
}

id objc_msgSend_transactionLog(void *a1, const char *a2, ...)
{
  return _[a1 transactionLog];
}

id objc_msgSend_transactionRecordZone(void *a1, const char *a2, ...)
{
  return _[a1 transactionRecordZone];
}

id objc_msgSend_transactionRecordZoneFetchDate(void *a1, const char *a2, ...)
{
  return _[a1 transactionRecordZoneFetchDate];
}

id objc_msgSend_transactionRecordZoneSubscriptionCreationDate(void *a1, const char *a2, ...)
{
  return _[a1 transactionRecordZoneSubscriptionCreationDate];
}

id objc_msgSend_transactionType(void *a1, const char *a2, ...)
{
  return _[a1 transactionType];
}

id objc_msgSend_triggerReindexingForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerReindexingForReason:");
}

id objc_msgSend_truncateFileAtOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "truncateFileAtOffset:");
}

id objc_msgSend_ttyType(void *a1, const char *a2, ...)
{
  return _[a1 ttyType];
}

id objc_msgSend_txLog(void *a1, const char *a2, ...)
{
  return _[a1 txLog];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unarchiveCallObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchiveCallObject:");
}

id objc_msgSend_unarchivedObjectFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectFromData:error:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIDOverride];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _[a1 uniqueId];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_update_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "update:");
}

id objc_msgSend_updateCacheWithDestinationIDs_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheWithDestinationIDs:completion:");
}

id objc_msgSend_updateCall_withFingerprintedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCall:withFingerprintedCall:");
}

id objc_msgSend_updateCallRecordsWithCalls_error_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCallRecordsWithCalls:error:save:");
}

id objc_msgSend_updateCallsHavingHandles_orContactIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCallsHavingHandles:orContactIdentifier:");
}

id objc_msgSend_updateCloudKitActivation(void *a1, const char *a2, ...)
{
  return _[a1 updateCloudKitActivation];
}

id objc_msgSend_updateCurrentHistoryToken(void *a1, const char *a2, ...)
{
  return _[a1 updateCurrentHistoryToken];
}

id objc_msgSend_updateMergeResult_sync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMergeResult_sync:");
}

id objc_msgSend_updateSearchableStatusFor_newStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSearchableStatusFor:newStatus:");
}

id objc_msgSend_updateSyncHistory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSyncHistory:");
}

id objc_msgSend_upload_withCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upload:withCallback:");
}

id objc_msgSend_uploadChanges_sync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uploadChanges_sync");
}

id objc_msgSend_uploadRecordsToSave_withRecordsToDelete_withRetryCount_withCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uploadRecordsToSave:withRecordsToDelete:withRetryCount:withCallback:");
}

id objc_msgSend_urlForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlForCall:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_validRemoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 validRemoteParticipantHandles];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valuesByKey(void *a1, const char *a2, ...)
{
  return _[a1 valuesByKey];
}

id objc_msgSend_verificationStatus(void *a1, const char *a2, ...)
{
  return _[a1 verificationStatus];
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeFileOffset(void *a1, const char *a2, ...)
{
  return _[a1 writeFileOffset];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return _[a1 zoneID];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return _[a1 zoneName];
}