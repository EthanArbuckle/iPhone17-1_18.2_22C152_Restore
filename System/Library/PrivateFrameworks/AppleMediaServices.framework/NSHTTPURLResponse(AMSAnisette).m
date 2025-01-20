@interface NSHTTPURLResponse(AMSAnisette)
- (id)ams_actionData;
- (id)ams_actionDataV1;
- (id)ams_actionDataV1_5;
- (id)ams_actionName;
- (id)ams_actionNameV1;
- (id)ams_actionNameV1_5;
- (uint64_t)_anisetteType;
@end

@implementation NSHTTPURLResponse(AMSAnisette)

- (id)ams_actionNameV1_5
{
  v1 = [a1 allHeaderFields];
  v2 = objc_msgSend(v1, "ams_objectForCaseInsensitiveKey:", @"X-Apple-AMD-Action");

  if (![v2 length])
  {

    v2 = 0;
  }
  return v2;
}

- (id)ams_actionNameV1
{
  v1 = [a1 allHeaderFields];
  v2 = objc_msgSend(v1, "ams_objectForCaseInsensitiveKey:", @"X-Apple-MD-Action");

  if (![v2 length])
  {

    v2 = 0;
  }
  return v2;
}

- (id)ams_actionData
{
  uint64_t v2 = [a1 _anisetteType];
  if (v2 == 2 || v2 == 1)
  {
    v3 = objc_msgSend(a1, "ams_actionDataV1");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)ams_actionDataV1
{
  v1 = [a1 allHeaderFields];
  uint64_t v2 = objc_msgSend(v1, "ams_objectForCaseInsensitiveKey:", @"X-Apple-MD-Data");

  if ([v2 length]) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v2 options:0];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)ams_actionDataV1_5
{
  v1 = [a1 allHeaderFields];
  uint64_t v2 = objc_msgSend(v1, "ams_objectForCaseInsensitiveKey:", @"X-Apple-AMD-Data");

  if ([v2 length]) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v2 options:0];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)ams_actionName
{
  uint64_t v2 = objc_msgSend(a1, "ams_actionNameV1");
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "ams_actionNameV1");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (uint64_t)_anisetteType
{
  uint64_t v2 = objc_msgSend(a1, "ams_actionNameV1");

  if (v2) {
    return 1;
  }
  id v4 = objc_msgSend(a1, "ams_actionNameV1");
  BOOL v5 = v4 != 0;

  return 2 * v5;
}

@end