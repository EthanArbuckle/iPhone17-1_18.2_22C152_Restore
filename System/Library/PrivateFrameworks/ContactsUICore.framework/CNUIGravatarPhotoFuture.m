@interface CNUIGravatarPhotoFuture
@end

@implementation CNUIGravatarPhotoFuture

uint64_t __61___CNUIGravatarPhotoFuture_photoForEmailAddresses_dataProxy___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) photoForEmailAddress:a2 dataProxy:*(void *)(a1 + 32)];
}

id __61___CNUIGravatarPhotoFuture_photoForEmailAddresses_dataProxy___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"email-address";
  v1 = (*(void (**)(void, void))(*MEMORY[0x263F33500] + 16))(*MEMORY[0x263F33500], *(void *)(a1 + 32));
  v7[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v3 = +[CNContactsUIError errorWithCode:402 userInfo:v2];

  v4 = [MEMORY[0x263F335E0] futureWithError:v3];

  return v4;
}

id __59___CNUIGravatarPhotoFuture_photoForEmailAddress_dataProxy___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"email-address";
  v1 = (*(void (**)(void, void))(*MEMORY[0x263F33500] + 16))(*MEMORY[0x263F33500], *(void *)(a1 + 32));
  v7[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v3 = +[CNContactsUIError errorWithCode:402 userInfo:v2];

  v4 = [MEMORY[0x263F335E0] futureWithError:v3];

  return v4;
}

@end