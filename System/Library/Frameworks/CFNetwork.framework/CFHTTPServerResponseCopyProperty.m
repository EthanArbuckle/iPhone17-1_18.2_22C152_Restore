@interface CFHTTPServerResponseCopyProperty
@end

@implementation CFHTTPServerResponseCopyProperty

void *___CFHTTPServerResponseCopyProperty_block_invoke(uint64_t a1, void *a2)
{
  int ExactString = _findExactString(*(CFStringRef *)(a1 + 40), 9u);
  if (ExactString == 481532279)
  {
    result = (void *)a2[11];
    if (!result)
    {
      uint64_t v6 = a2[10];
      if (!v6) {
        goto LABEL_9;
      }
      result = (void *)(v6 - 16);
    }
LABEL_11:
    result = (void *)CFRetain(result);
    goto LABEL_12;
  }
  if (ExactString == 480483688)
  {
    result = (void *)a2[12];
    if (!result) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (ExactString != 479459672)
  {
LABEL_9:
    result = 0;
    goto LABEL_12;
  }
  result = (void *)a2[10];
  if (result) {
    result = (void *)HTTPServerRequest::copyProperty((HTTPServerRequest *)result, (CFStringRef)&unk_1EC0A44C0);
  }
LABEL_12:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end