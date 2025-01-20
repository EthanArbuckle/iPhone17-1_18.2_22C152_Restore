@interface CNUIRemotePhotoFutures
+ (id)directoryServicesPhotoForEmailAddresses:(id)a3;
+ (id)gravatarPhotoForEmailAddresses:(id)a3;
+ (id)localPhotoForEmailAddresses:(id)a3;
+ (id)photoForContact:(id)a3;
+ (id)photoForContact:(id)a3 userDefaults:(id)a4;
@end

@implementation CNUIRemotePhotoFutures

+ (id)localPhotoForEmailAddresses:(id)a3
{
  v3 = (void *)MEMORY[0x263F335E0];
  v4 = +[CNContactsUIError errorWithCode:402];
  v5 = [v3 futureWithError:v4];

  return v5;
}

id __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke_4()
{
  v0 = (void *)MEMORY[0x263F335E0];
  v1 = +[CNContactsUIError errorWithCode:402];
  v2 = [v0 futureWithError:v1];

  return v2;
}

+ (id)photoForContact:(id)a3
{
  v4 = (void *)MEMORY[0x263F33698];
  id v5 = a3;
  v6 = [v4 standardPreferences];
  v7 = [a1 photoForContact:v5 userDefaults:v6];

  return v7;
}

+ (id)photoForContact:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isKeyAvailable:*MEMORY[0x263EFDF80]])
  {
    v8 = [v6 emailAddresses];
    v9 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_29);

    if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
    {
      v10 = (void *)MEMORY[0x263F335E0];
      v11 = +[CNContactsUIError errorWithCode:402];
      uint64_t v12 = [v10 futureWithError:v11];
    }
    else
    {
      v11 = [a1 localPhotoForEmailAddresses:v9];
      if ([v7 userHasOptedInToPreference:@"com.apple.private.contacts.directory-services-images"])
      {
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke_2;
        v25[3] = &unk_264018320;
        id v27 = a1;
        id v26 = v9;
        uint64_t v16 = [v11 recover:v25];

        v11 = (void *)v16;
      }
      if (([v7 userHasOptedInToPreference:@"com.apple.private.contacts.gravatar-images"] & 1) != 0
        || [v7 userHasOptedInToPreference:@"ABUseGravatarImages"])
      {
        uint64_t v19 = MEMORY[0x263EF8330];
        uint64_t v20 = 3221225472;
        v21 = __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke_3;
        v22 = &unk_264018320;
        id v24 = a1;
        id v23 = v9;
        uint64_t v17 = [v11 recover:&v19];

        v11 = (void *)v17;
      }
      uint64_t v12 = objc_msgSend(v11, "recover:", &__block_literal_global_12_0, v19, v20, v21, v22);
    }
    v15 = (void *)v12;
  }
  else
  {
    v13 = (void *)MEMORY[0x263F335E0];
    v14 = +[CNContactsUIError errorWithCode:402];
    v15 = [v13 futureWithError:v14];
  }
  return v15;
}

uint64_t __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) directoryServicesPhotoForEmailAddresses:*(void *)(a1 + 32)];
}

uint64_t __55__CNUIRemotePhotoFutures_photoForContact_userDefaults___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 40) gravatarPhotoForEmailAddresses:*(void *)(a1 + 32)];
}

+ (id)directoryServicesPhotoForEmailAddresses:(id)a3
{
  return +[_CNUIDirectoryServicesPhotoFuture photoForEmailAddresses:a3];
}

+ (id)gravatarPhotoForEmailAddresses:(id)a3
{
  return +[_CNUIGravatarPhotoFuture photoForEmailAddresses:a3];
}

@end