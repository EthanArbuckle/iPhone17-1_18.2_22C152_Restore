@interface ASFAsn1OSToken
- (void)stringValue;
@end

@implementation ASFAsn1OSToken

- (void)stringValue
{
  if (a1)
  {
    v2 = a1;
    uint64_t v3 = a1[4];
    if (!v3) {
      goto LABEL_7;
    }
    uint64_t v4 = *(void *)(v3 + 16);
    switch(v4)
    {
      case 22:
        uint64_t v5 = 1;
        break;
      case 12:
        uint64_t v5 = 4;
        break;
      case 2:
        a1 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", *(void *)(v3 + 32));
LABEL_13:
        uint64_t v1 = vars8;
        goto LABEL_14;
      default:
LABEL_7:
        a1 = 0;
        goto LABEL_13;
    }
    id v7 = [NSString alloc];
    v8 = (void *)v2[4];
    if (v8) {
      id Property = objc_getProperty(v8, v6, 24, 1);
    }
    else {
      id Property = 0;
    }
    a1 = (void *)[v7 initWithData:Property encoding:v5];
    goto LABEL_13;
  }
LABEL_14:
  return a1;
}

- (void).cxx_destruct
{
}

@end