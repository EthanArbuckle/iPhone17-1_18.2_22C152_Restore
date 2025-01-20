@interface CAFMedia
+ (id)accessoryIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (NSArray)mediaSourceServices;
- (void)registerObserver:(id)a3;
- (void)tuneToFrequency:(unsigned int)a3 inSourceWithIdentifier:(id)a4 completion:(id)a5;
- (void)tuneToFrequency:(unsigned int)a3 inSourceWithIdentifier:(id)a4 multicastIndex:(int64_t)a5 completion:(id)a6;
- (void)tuneToMediaItem:(id)a3 inSource:(id)a4 completion:(id)a5;
- (void)tuneToMediaItem:(id)a3 inSource:(id)a4 multicastIndex:(int64_t)a5 completion:(id)a6;
- (void)tuneToMediaItemIdentifier:(id)a3 inSourceWithIdentifier:(id)a4 completion:(id)a5;
- (void)tuneToMediaItemIdentifier:(id)a3 inSourceWithIdentifier:(id)a4 multicastIndex:(int64_t)a5 completion:(id)a6;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFMedia

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMedia;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8670]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFMedia;
  [(CAFAccessory *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8670]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFMedia;
  [(CAFAccessory *)&v6 unregisterObserver:v5];
}

- (NSArray)mediaSourceServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000014000006"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000014000006"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

+ (id)accessoryIdentifier
{
  return @"0x0000000003000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB0AF8;
}

- (void)tuneToMediaItem:(id)a3 inSource:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = CAFGeneralLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CAFMedia(Utilties) tuneToMediaItem:inSource:completion:]((uint64_t)v8, (uint64_t)v9, v11);
  }

  v12 = [v8 identifier];
  v13 = [v9 identifier];
  [(CAFMedia *)self tuneToMediaItemIdentifier:v12 inSourceWithIdentifier:v13 completion:v10];
}

- (void)tuneToFrequency:(unsigned int)a3 inSourceWithIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = CAFGeneralLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [NSNumber numberWithUnsignedInt:v6];
    *(_DWORD *)buf = 138412546;
    v45 = v11;
    __int16 v46 = 2112;
    id v47 = v8;
    _os_log_impl(&dword_249710000, v10, OS_LOG_TYPE_DEFAULT, "Tuning to frequency %@ in source %@", buf, 0x16u);
  }
  v12 = [(CAFAccessory *)self car];
  v13 = [v12 mediaSourceWithIdentifier:v8];

  if (!v13)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke;
    block[3] = &unk_265263360;
    id v43 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
    v16 = v43;
    goto LABEL_15;
  }
  v14 = [(CAFAccessory *)self car];
  v15 = [v14 nowPlayingInformation];
  v16 = [v15 nowPlaying];

  if (!v16)
  {
    v21 = CAFGeneralLogging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CAFMedia(Utilties) tuneToFrequency:inSourceWithIdentifier:completion:](v21, v22, v23, v24, v25, v26, v27, v28);
    }

    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke_21;
    v40[3] = &unk_265263360;
    id v41 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v40);
    v29 = v41;
    goto LABEL_14;
  }
  v17 = [v13 currentFrequencyRange];
  uint64_t v18 = [v17 valueRoundedToNearestStepValue:v6];

  v19 = [v13 currentFrequencyRange];
  char v20 = [v19 valueIsInRange:v18];

  if ((v20 & 1) == 0)
  {
    v30 = CAFGeneralLogging();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[CAFMedia(Utilties) tuneToFrequency:inSourceWithIdentifier:completion:](v30, v31, v32, v33, v34, v35, v36, v37);
    }

    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke_22;
    v38[3] = &unk_265263360;
    id v39 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v38);
    v29 = v39;
LABEL_14:

    goto LABEL_15;
  }
  [v16 tuneToFrequency:v18 sourceIdentifier:v8 completion:v9];
LABEL_15:
}

void __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:CAFErrorDomain code:-1 userInfo:0];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke_21(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:CAFErrorDomain code:-1 userInfo:0];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke_22(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:CAFErrorDomain code:-1 userInfo:0];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)tuneToMediaItemIdentifier:(id)a3 inSourceWithIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = CAFGeneralLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_249710000, v11, OS_LOG_TYPE_DEFAULT, "Tuning to media item identifier %@ in source %@", buf, 0x16u);
  }

  v12 = [(CAFAccessory *)self car];
  v13 = [v12 nowPlayingInformation];
  v14 = [v13 nowPlaying];

  if (v14)
  {
    [v14 tuneToIdentifier:v8 sourceIdentifier:v9 completion:v10];
  }
  else
  {
    v15 = CAFGeneralLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CAFMedia(Utilties) tuneToFrequency:inSourceWithIdentifier:completion:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__CAFMedia_Utilties__tuneToMediaItemIdentifier_inSourceWithIdentifier_completion___block_invoke;
    block[3] = &unk_265263360;
    id v24 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __82__CAFMedia_Utilties__tuneToMediaItemIdentifier_inSourceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:CAFErrorDomain code:-1 userInfo:0];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)tuneToMediaItem:(id)a3 inSource:(id)a4 multicastIndex:(int64_t)a5 completion:(id)a6
{
}

- (void)tuneToFrequency:(unsigned int)a3 inSourceWithIdentifier:(id)a4 multicastIndex:(int64_t)a5 completion:(id)a6
{
}

- (void)tuneToMediaItemIdentifier:(id)a3 inSourceWithIdentifier:(id)a4 multicastIndex:(int64_t)a5 completion:(id)a6
{
}

@end