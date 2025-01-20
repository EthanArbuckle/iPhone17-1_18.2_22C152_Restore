@interface ADPhoneticEmbedder
+ (id)sharedEmbedder;
- (void)findAlternativesForString:(id)a3 maxResults:(int)a4 completion:(id)a5;
- (void)preheatEuclidModelWithLanguageCode:(id)a3 clientID:(id)a4;
@end

@implementation ADPhoneticEmbedder

+ (id)sharedEmbedder
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100321034;
  block[3] = &unk_10050E350;
  block[4] = a1;
  if (qword_1005863A0 != -1) {
    dispatch_once(&qword_1005863A0, block);
  }
  v2 = (void *)qword_1005863A8;
  return v2;
}

- (void).cxx_destruct
{
}

- (void)findAlternativesForString:(id)a3 maxResults:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v9 = (void (**)(void, void, void))v8;
  phoneticEmbedder = self->phoneticEmbedder;
  if (phoneticEmbedder)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100321190;
    v13[3] = &unk_10050C2C8;
    id v14 = v8;
    [(CESRPhoneticEmbedder *)phoneticEmbedder findAlternativesForString:a3 maxResults:v5 completion:v13];
  }
  else
  {
    id v11 = [objc_alloc((Class)NSString) initWithFormat:@"Euclid model should be preheated with language code before calling findAlternativesForString"];
    v12 = +[NSError errorWithDomain:v11 code:0 userInfo:0];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v12);
  }
}

- (void)preheatEuclidModelWithLanguageCode:(id)a3 clientID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (CESRPhoneticEmbedder *)[objc_alloc((Class)CESRPhoneticEmbedder) initWithLocaleIdentifier:v7 clientID:v6];

  phoneticEmbedder = self->phoneticEmbedder;
  self->phoneticEmbedder = v8;
}

@end