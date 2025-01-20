@interface PARTopicResponse
+ (id)responseFromReply:(id)a3;
- (PARTopicResponse)initWithReply:(id)a3 factory:(id)a4 dataZKW:(id)a5;
@end

@implementation PARTopicResponse

- (PARTopicResponse)initWithReply:(id)a3 factory:(id)a4 dataZKW:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  uint64_t v9 = sub_19C898E40();
  unint64_t v11 = v10;

  return (PARTopicResponse *)PARTopicResponse.init(reply:factory:dataZKW:)(v7, a4, v9, v11);
}

+ (id)responseFromReply:(id)a3
{
  id v3 = a3;
  v4 = [v3 task];
  v5 = [v4 request];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 session];
    id v8 = [v7 configuration];
    uint64_t v9 = [v8 factory];
    unint64_t v10 = v9;
    if (v9) {
      unint64_t v11 = v9;
    }
    else {
      unint64_t v11 = objc_alloc_init(PARDefaultFactory);
    }
    v13 = v11;

    v14 = [PARTopicResponse alloc];
    v15 = [v3 data];
    v12 = [(PARTopicResponse *)v14 initWithReply:v3 factory:v13 dataZKW:v15];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end