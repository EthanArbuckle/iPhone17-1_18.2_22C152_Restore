@interface ConferenceDatatypeConverter
+ (id)_calJoinMethodFromEKJoinMethod:(id)a3;
+ (id)_calJoinMethodsFromEKJoinMethods:(id)a3;
+ (id)_ekJoinMethodFromCalJoinMethod:(id)a3;
+ (id)_ekJoinMethodsFromCalJoinMethods:(id)a3;
+ (id)_ekVirtualConferenceFromCalVirtualConference:(id)a3;
+ (id)calVirtualConferenceFromEKVirtualConference:(id)a3;
+ (id)ekDeserializationResultFromCalDeserializationResult:(id)a3;
+ (unint64_t)_calSourceFromEKSource:(unint64_t)a3;
+ (unint64_t)_ekSourceFromCalSource:(unint64_t)a3;
@end

@implementation ConferenceDatatypeConverter

+ (id)ekDeserializationResultFromCalDeserializationResult:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 conference];
    v6 = [a1 _ekVirtualConferenceFromCalVirtualConference:v5];

    v7 = [v4 blockTitle];
    [v6 setSerializationBlockTitle:v7];

    v8 = [EKConferenceDeserializationResult alloc];
    uint64_t v9 = [v4 range];
    uint64_t v11 = v10;

    v12 = -[EKConferenceDeserializationResult initWithConference:range:](v8, "initWithConference:range:", v6, v9, v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)calVirtualConferenceFromEKVirtualConference:(id)a3
{
  id v4 = a3;
  v5 = [v4 joinMethods];
  v6 = [a1 _calJoinMethodsFromEKJoinMethods:v5];

  uint64_t v7 = objc_msgSend(a1, "_calSourceFromEKSource:", objc_msgSend(v4, "source"));
  id v8 = objc_alloc(MEMORY[0x1E4F57808]);
  uint64_t v9 = [v4 title];
  uint64_t v10 = [v4 conferenceDetails];
  uint64_t v11 = [v4 isWritable];

  v12 = (void *)[v8 initWithTitle:v9 joinMethods:v6 conferenceDetails:v10 source:v7 isWritable:v11];

  return v12;
}

+ (id)_ekVirtualConferenceFromCalVirtualConference:(id)a3
{
  id v4 = a3;
  v5 = [v4 joinMethods];
  v6 = [a1 _ekJoinMethodsFromCalJoinMethods:v5];

  uint64_t v7 = objc_msgSend(a1, "_ekSourceFromCalSource:", objc_msgSend(v4, "source"));
  id v8 = [EKVirtualConference alloc];
  uint64_t v9 = [v4 title];
  uint64_t v10 = [v4 conferenceDetails];

  uint64_t v11 = [(EKVirtualConference *)v8 initWithTitle:v9 joinMethods:v6 conferenceDetails:v10];
  [(EKVirtualConference *)v11 setSource:v7];

  return v11;
}

+ (id)_calJoinMethodFromEKJoinMethod:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F57810];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 title];
  uint64_t v7 = [v4 URL];
  uint64_t v8 = [v4 isBroadcast];

  uint64_t v9 = (void *)[v5 initWithTitle:v6 URL:v7 isBroadcast:v8];

  return v9;
}

+ (id)_calJoinMethodsFromEKJoinMethods:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__ConferenceDatatypeConverter__calJoinMethodsFromEKJoinMethods___block_invoke;
  v5[3] = &__block_descriptor_40_e71___CalVirtualConferenceJoinMethod_16__0__EKVirtualConferenceJoinMethod_8l;
  v5[4] = a1;
  v3 = [a3 CalMap:v5];

  return v3;
}

uint64_t __64__ConferenceDatatypeConverter__calJoinMethodsFromEKJoinMethods___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _calJoinMethodFromEKJoinMethod:a2];
}

+ (id)_ekJoinMethodFromCalJoinMethod:(id)a3
{
  id v3 = a3;
  id v4 = [EKVirtualConferenceJoinMethod alloc];
  id v5 = [v3 title];
  v6 = [v3 URL];
  uint64_t v7 = [(EKVirtualConferenceJoinMethod *)v4 initWithTitle:v5 url:v6];

  uint64_t v8 = [v3 isBroadcast];
  [(EKVirtualConferenceJoinMethod *)v7 setIsBroadcast:v8];

  return v7;
}

+ (id)_ekJoinMethodsFromCalJoinMethods:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__ConferenceDatatypeConverter__ekJoinMethodsFromCalJoinMethods___block_invoke;
  v5[3] = &__block_descriptor_40_e71___EKVirtualConferenceJoinMethod_16__0__CalVirtualConferenceJoinMethod_8l;
  v5[4] = a1;
  id v3 = [a3 CalMap:v5];

  return v3;
}

uint64_t __64__ConferenceDatatypeConverter__ekJoinMethodsFromCalJoinMethods___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _ekJoinMethodFromCalJoinMethod:a2];
}

+ (unint64_t)_calSourceFromEKSource:(unint64_t)a3
{
  return a3 != 0;
}

+ (unint64_t)_ekSourceFromCalSource:(unint64_t)a3
{
  return a3 != 0;
}

@end