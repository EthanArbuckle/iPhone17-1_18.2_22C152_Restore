@interface AMPCardMetadataRegistration
+ (id)_cardArtworkForPaymentPass:(id)a3 width:(double)a4;
+ (id)_passesForPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
+ (id)metadataForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 size:(id)a5;
@end

@implementation AMPCardMetadataRegistration

+ (id)metadataForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 size:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v26 = a5;
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = [a1 _passesForPassTypeIdentifier:v8 serialNumber:v9];
  v11 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v11)
  {
    v11 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    v12 |= 2u;
  }
  v13 = [v11 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    int v14 = v12;
  }
  else {
    int v14 = v12 & 2;
  }
  if (v14)
  {
    v15 = objc_opt_class();
    v16 = NSNumber;
    id v17 = v15;
    objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    *(_DWORD *)location = 138543618;
    *(void *)&location[4] = v15;
    __int16 v32 = 2114;
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 22;
    v18 = (void *)_os_log_send_and_compose_impl();

    if (v18)
    {
      v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, location, v24);
      free(v18);
      SSFileLog();
    }
  }
  else
  {
  }
  objc_initWeak((id *)location, a1);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __79__AMPCardMetadataRegistration_metadataForPassTypeIdentifier_serialNumber_size___block_invoke;
  v27[3] = &unk_264E7C820;
  objc_copyWeak(&v30, (id *)location);
  id v20 = v26;
  id v28 = v20;
  id v21 = v25;
  id v29 = v21;
  [v10 enumerateObjectsUsingBlock:v27];
  v22 = (void *)[v21 copy];

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)location);

  return v22;
}

void __79__AMPCardMetadataRegistration_metadataForPassTypeIdentifier_serialNumber_size___block_invoke(id *a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = objc_alloc_init(MEMORY[0x263F27BA8]);
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy_;
  v68 = __Block_byref_object_dispose_;
  id v69 = 0;
  [a1[4] floatValue];
  if (v6 > 0.0)
  {
    double v7 = v6;
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    v58 = __79__AMPCardMetadataRegistration_metadataForPassTypeIdentifier_serialNumber_size___block_invoke_17;
    v59 = &unk_264E7C7F8;
    v62 = &v64;
    id v60 = WeakRetained;
    id v61 = v3;
    double v63 = v7;
    dispatch_sync(MEMORY[0x263EF83A0], &block);
    id v8 = (void *)v65[5];
    if (v8)
    {
      id v9 = [v8 base64EncodedStringWithOptions:1];
      v10 = [NSString stringWithFormat:@"data:image/png;base64,%@", v9];
      [v5 setCardArtwork:v10];
    }
    else
    {
      id v9 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v9)
      {
        id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v41 = [v9 shouldLog];
      int v42 = [v9 shouldLogToDisk];
      v43 = [v9 OSLogObject];
      v10 = v43;
      if (v42) {
        v41 |= 2u;
      }
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        v41 &= 2u;
      }
      if (v41)
      {
        v44 = objc_opt_class();
        int v70 = 138543362;
        v71 = v44;
        id v45 = v44;
        LODWORD(v55) = 12;
        v54 = &v70;
        v46 = (void *)_os_log_send_and_compose_impl();

        if (!v46) {
          goto LABEL_5;
        }
        v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v46, 4, &v70, v55, block, v57, v58, v59, v60);
        free(v46);
        v54 = (int *)v10;
        SSFileLog();
      }
    }

LABEL_5:
    goto LABEL_17;
  }
  v11 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v11)
  {
    v11 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v12 = [v11 shouldLog];
  int v13 = [v11 shouldLogToDisk];
  int v14 = [v11 OSLogObject];
  v15 = v14;
  if (v13) {
    v12 |= 2u;
  }
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v12 &= 2u;
  }
  if (!v12) {
    goto LABEL_15;
  }
  v16 = objc_opt_class();
  int v70 = 138543362;
  v71 = v16;
  id v17 = v16;
  LODWORD(v55) = 12;
  v54 = &v70;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v70, v55);
    free(v18);
    v54 = (int *)v15;
    SSFileLog();
LABEL_15:
  }
LABEL_17:
  v19 = objc_msgSend(v3, "localizedDescription", v54);
  [v5 setDescriptionShort:v19];

  id v20 = [v3 serialNumber];
  [v5 setSerialNumber:v20];

  getPKPaymentPassClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setSuffix:", objc_msgSend(v3, "performSelector:withObject:", sel_primaryAccountNumberSuffix, 0));
  }
  id v21 = [v3 paymentPass];
  v22 = [v21 associatedAccountServiceAccountIdentifier];
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    uint64_t v24 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v24)
    {
      uint64_t v24 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v25 = [v24 shouldLog];
    int v26 = [v24 shouldLogToDisk];
    v27 = [v24 OSLogObject];
    id v28 = v27;
    if (v26) {
      v25 |= 2u;
    }
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      v25 &= 2u;
    }
    if (v25)
    {
      id v29 = objc_opt_class();
      int v70 = 138543362;
      v71 = v29;
      id v30 = v29;
      LODWORD(v55) = 12;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
        uint64_t v32 = 2;
        goto LABEL_61;
      }
      id v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v70, v55);
      free(v31);
      SSFileLog();
    }
    uint64_t v32 = 2;
    goto LABEL_60;
  }
  id v33 = [v3 paymentPass];
  int v34 = [v33 hasAssociatedPeerPaymentAccount];

  if (v34)
  {
    uint64_t v24 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v24)
    {
      uint64_t v24 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v35 = [v24 shouldLog];
    int v36 = [v24 shouldLogToDisk];
    v37 = [v24 OSLogObject];
    id v28 = v37;
    if (v36) {
      v35 |= 2u;
    }
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
      v35 &= 2u;
    }
    if (v35)
    {
      v38 = objc_opt_class();
      int v70 = 138543362;
      v71 = v38;
      id v39 = v38;
      LODWORD(v55) = 12;
      v40 = (void *)_os_log_send_and_compose_impl();

      if (!v40)
      {
        uint64_t v32 = 1;
        goto LABEL_61;
      }
      id v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v40, 4, &v70, v55);
      free(v40);
      SSFileLog();
    }
    uint64_t v32 = 1;
    goto LABEL_60;
  }
  uint64_t v24 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v24)
  {
    uint64_t v24 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v47 = [v24 shouldLog];
  int v48 = [v24 shouldLogToDisk];
  v49 = [v24 OSLogObject];
  id v28 = v49;
  if (v48) {
    v47 |= 2u;
  }
  if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
    v47 &= 2u;
  }
  if (!v47)
  {
LABEL_59:
    uint64_t v32 = 0;
LABEL_60:

    goto LABEL_61;
  }
  v50 = objc_opt_class();
  int v70 = 138543362;
  v71 = v50;
  id v51 = v50;
  LODWORD(v55) = 12;
  uint64_t v32 = _os_log_send_and_compose_impl();

  if (v32)
  {
    id v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v32, 4, &v70, v55);
    free((void *)v32);
    SSFileLog();
    goto LABEL_59;
  }
LABEL_61:

  [v5 setCardType:v32];
  v52 = [v3 paymentPass];
  v53 = [v52 devicePrimaryInAppPaymentApplication];
  objc_msgSend(v5, "setPaymentNetwork:", objc_msgSend(v53, "paymentNetworkIdentifier"));

  [a1[5] addObject:v5];
  _Block_object_dispose(&v64, 8);
}

uint64_t __79__AMPCardMetadataRegistration_metadataForPassTypeIdentifier_serialNumber_size___block_invoke_17(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _cardArtworkForPaymentPass:*(void *)(a1 + 40) width:*(double *)(a1 + 56)];
  return MEMORY[0x270F9A758]();
}

+ (id)_cardArtworkForPaymentPass:(id)a3 width:(double)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_cardArtworkForPaymentPass_width__onceToken != -1) {
    dispatch_once(&_cardArtworkForPaymentPass_width__onceToken, &__block_literal_global_0);
  }
  objc_msgSend(v5, "cardImageWithDimensions:", a4, a4);
  float v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  double v7 = v6;
  if (v6)
  {
    id v8 = UIImagePNGRepresentation(v6);
    goto LABEL_17;
  }
  id v9 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v9)
  {
    id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  int v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_15;
  }
  LODWORD(v17) = 138543362;
  *(void *)((char *)&v17 + 4) = objc_opt_class();
  id v13 = *(id *)((char *)&v17 + 4);
  LODWORD(v16) = 12;
  int v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    int v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v17, v16, v17);
    free(v14);
    SSFileLog();
LABEL_15:
  }
  id v8 = 0;
LABEL_17:

  return v8;
}

void __64__AMPCardMetadataRegistration__cardArtworkForPaymentPass_width___block_invoke()
{
  if (PassKitUILibrary_sOnce != -1) {
    dispatch_once(&PassKitUILibrary_sOnce, &__block_literal_global_35);
  }
}

+ (id)_passesForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(getPKPassLibraryClass());
  uint64_t v8 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  id v9 = (void *)v8;
  if (!v5 || !v6)
  {
    if (!v8)
    {
      id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v18 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    id v20 = [v9 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (v19)
    {
      int v35 = 138543362;
      id v36 = (id)objc_opt_class();
      id v21 = v36;
      LODWORD(v33) = 12;
      uint64_t v32 = &v35;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_27:

        long long v17 = [v7 passesOfType:1];
        goto LABEL_41;
      }
      id v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v35, v33);
      free(v22);
      uint64_t v32 = (int *)v20;
      SSFileLog();
    }

    goto LABEL_27;
  }
  if (!v8)
  {
    id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  int v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (v11)
  {
    int v35 = 138543362;
    id v36 = (id)objc_opt_class();
    id v13 = v36;
    LODWORD(v33) = 12;
    uint64_t v32 = &v35;
    int v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_14;
    }
    int v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v35, v33);
    free(v14);
    uint64_t v32 = (int *)v12;
    SSFileLog();
  }

LABEL_14:
  uint64_t v15 = [v7 passWithPassTypeIdentifier:v5 serialNumber:v6];
  uint64_t v16 = (void *)v15;
  if (!v15)
  {
    BOOL v23 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v23)
    {
      BOOL v23 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v24 = objc_msgSend(v23, "shouldLog", v32);
    if ([v23 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    int v26 = [v23 OSLogObject];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      v25 &= 2u;
    }
    if (v25)
    {
      v27 = objc_opt_class();
      int v35 = 138543362;
      id v36 = v27;
      id v28 = v27;
      LODWORD(v33) = 12;
      uint64_t v32 = &v35;
      id v29 = (void *)_os_log_send_and_compose_impl();

      if (!v29)
      {
LABEL_39:

        long long v17 = 0;
        goto LABEL_40;
      }
      int v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v35, v33);
      free(v29);
      uint64_t v32 = (int *)v26;
      SSFileLog();
    }

    goto LABEL_39;
  }
  uint64_t v34 = v15;
  long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
LABEL_40:

LABEL_41:
  id v30 = objc_msgSend(v17, "copy", v32);

  return v30;
}

@end