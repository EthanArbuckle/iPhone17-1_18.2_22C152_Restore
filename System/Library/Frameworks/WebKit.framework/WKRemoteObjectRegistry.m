@interface WKRemoteObjectRegistry
@end

@implementation WKRemoteObjectRegistry

void __41___WKRemoteObjectRegistry__invokeMethod___block_invoke(void *a1, uint64_t a2)
{
  v4 = objc_alloc_init(WKRemoteObjectEncoder);
  [(WKRemoteObjectEncoder *)v4 encodeObject:a2 forKey:@"invocation"];
  v5 = *(uint64_t **)(a1[5] + 8);
  if (v5)
  {
    uint64_t v6 = a1[6];
    uint64_t v7 = [(WKRemoteObjectEncoder *)v4 rootObjectDictionary];
    uint64_t v8 = v7;
    if (v7) {
      CFRetain(*(CFTypeRef *)(v7 + 8));
    }
    uint64_t v10 = v8;
    v11[0] = v6;
    v11[1] = (uint64_t)&v10;
    WebKit::RemoteObjectRegistry::send<Messages::RemoteObjectRegistry::CallReplyBlock>(v5, v11);
    uint64_t v9 = v10;
    uint64_t v10 = 0;
    if (v9) {
      CFRelease(*(CFTypeRef *)(v9 + 8));
    }
  }
  *(unsigned char *)(a1[7] + 24) = 1;
  if (v4) {
    CFRelease(v4);
  }
}

@end