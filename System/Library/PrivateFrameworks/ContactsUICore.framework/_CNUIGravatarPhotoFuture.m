@interface _CNUIGravatarPhotoFuture
+ (id)filenameForEmailAddress:(id)a3;
+ (id)hashForEmailAddress:(id)a3;
+ (id)photoForEmailAddress:(id)a3;
+ (id)photoForEmailAddress:(id)a3 dataProxy:(id)a4;
+ (id)photoForEmailAddresses:(id)a3;
+ (id)photoForEmailAddresses:(id)a3 dataProxy:(id)a4;
+ (id)urlForEmailAddress:(id)a3;
+ (int64_t)imageSize;
@end

@implementation _CNUIGravatarPhotoFuture

+ (id)photoForEmailAddresses:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F33588];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [a1 photoForEmailAddresses:v5 dataProxy:v6];

  return v7;
}

+ (id)photoForEmailAddresses:(id)a3 dataProxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    v8 = (void *)MEMORY[0x263F335E0];
    v9 = +[CNContactsUIError errorWithCode:401];
    v10 = [v8 futureWithError:v9];
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __61___CNUIGravatarPhotoFuture_photoForEmailAddresses_dataProxy___block_invoke;
    v16[3] = &unk_264018E80;
    id v18 = a1;
    id v17 = v7;
    v11 = objc_msgSend(v6, "_cn_map:", v16);
    v12 = [MEMORY[0x263F335E0] chain:v11];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61___CNUIGravatarPhotoFuture_photoForEmailAddresses_dataProxy___block_invoke_2;
    v14[3] = &unk_264018EA8;
    id v15 = v6;
    v10 = [v12 recover:v14];
  }
  return v10;
}

+ (id)photoForEmailAddress:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F33588];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [a1 photoForEmailAddress:v5 dataProxy:v6];

  return v7;
}

+ (id)photoForEmailAddress:(id)a3 dataProxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334E0] + 16))())
  {
    v8 = (void *)MEMORY[0x263F335E0];
    v9 = +[CNContactsUIError errorWithCode:401];
    v10 = [v8 futureWithError:v9];
  }
  else
  {
    v9 = [a1 urlForEmailAddress:v6];
    v11 = [v7 dataWithContentsOfURL:v9];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59___CNUIGravatarPhotoFuture_photoForEmailAddress_dataProxy___block_invoke;
    v13[3] = &unk_264018EA8;
    id v14 = v6;
    v10 = [v11 recover:v13];
  }
  return v10;
}

+ (id)urlForEmailAddress:(id)a3
{
  v4 = [a1 filenameForEmailAddress:a3];
  uint64_t v5 = [a1 imageSize];
  id v6 = [NSString stringWithFormat:@"https://www.gravatar.com/avatar/%@.jpg?s=%lu&d=404&r=pg", v4, v5];
  id v7 = [NSURL URLWithString:v6];

  return v7;
}

+ (id)filenameForEmailAddress:(id)a3
{
  v4 = objc_msgSend(a3, "_cn_trimmedString");
  uint64_t v5 = [MEMORY[0x263EFF960] currentLocale];
  id v6 = [v4 lowercaseStringWithLocale:v5];

  id v7 = [a1 hashForEmailAddress:v6];

  return v7;
}

+ (id)hashForEmailAddress:(id)a3
{
  v3 = [a3 dataUsingEncoding:4];
  v4 = objc_msgSend(v3, "_cn_md5Hash");
  uint64_t v5 = objc_msgSend(v4, "_cn_hexString");
  id v6 = [v5 lowercaseString];

  return v6;
}

+ (int64_t)imageSize
{
  return 512;
}

@end