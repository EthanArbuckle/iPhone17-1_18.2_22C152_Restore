@interface NSError(ATProtocolUtilities)
- (id)ATPError;
- (id)initWithATPError:()ATProtocolUtilities;
@end

@implementation NSError(ATProtocolUtilities)

- (id)ATPError
{
  v2 = objc_opt_new();
  objc_msgSend(v2, "setCode:", objc_msgSend(a1, "code"));
  v3 = [a1 domain];
  [v2 setDomain:v3];

  v4 = [a1 localizedDescription];
  [v2 setErrorDescription:v4];

  return v2;
}

- (id)initWithATPError:()ATProtocolUtilities
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 errorDescription];

  v6 = [v4 domain];
  int v7 = [v4 code];
  int v8 = v7;
  if (v5)
  {
    int v9 = v7;
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v10 = [v4 errorDescription];

    v15[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = (id)[a1 initWithDomain:v6 code:v9 userInfo:v11];
  }
  else
  {

    id v12 = (id)[a1 initWithDomain:v6 code:v8 userInfo:0];
  }

  return v12;
}

@end