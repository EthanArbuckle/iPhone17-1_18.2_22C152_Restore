@interface NSURLComponents
+ (NSURLComponents)allocWithZone:(_NSZone *)a3;
+ (NSURLComponents)componentsWithString:(NSString *)URLString;
+ (NSURLComponents)componentsWithString:(NSString *)URLString encodingInvalidCharacters:(BOOL)encodingInvalidCharacters;
+ (NSURLComponents)componentsWithURL:(NSURL *)url resolvingAgainstBaseURL:(BOOL)resolve;
+ (_NSRange)_matchWithString:(id)a3 requiredComponents:(unint64_t)a4 defaultValues:(id)a5 urlPtr:(id *)a6;
+ (id)_components;
+ (id)_componentsWithString:(id)a3 encodingInvalidCharacters:(BOOL)a4;
+ (id)_componentsWithUrl:(id)a3 resolvingAgainstBaseURL:(BOOL)a4;
- (NSArray)percentEncodedQueryItems;
- (NSArray)queryItems;
- (NSNumber)port;
- (NSRange)rangeOfFragment;
- (NSRange)rangeOfHost;
- (NSRange)rangeOfPassword;
- (NSRange)rangeOfPath;
- (NSRange)rangeOfPort;
- (NSRange)rangeOfQuery;
- (NSRange)rangeOfScheme;
- (NSRange)rangeOfUser;
- (NSString)encodedHost;
- (NSString)fragment;
- (NSString)host;
- (NSString)password;
- (NSString)path;
- (NSString)percentEncodedFragment;
- (NSString)percentEncodedHost;
- (NSString)percentEncodedPassword;
- (NSString)percentEncodedPath;
- (NSString)percentEncodedQuery;
- (NSString)percentEncodedUser;
- (NSString)query;
- (NSString)scheme;
- (NSString)string;
- (NSString)user;
- (NSURL)URL;
- (NSURL)URLRelativeToURL:(NSURL *)baseURL;
- (NSURLComponents)init;
- (NSURLComponents)initWithString:(NSString *)URLString;
- (NSURLComponents)initWithString:(NSString *)URLString encodingInvalidCharacters:(BOOL)encodingInvalidCharacters;
- (NSURLComponents)initWithURL:(NSURL *)url resolvingAgainstBaseURL:(BOOL)resolve;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEncodedHost:(NSString *)encodedHost;
- (void)setFragment:(NSString *)fragment;
- (void)setHost:(NSString *)host;
- (void)setPassword:(NSString *)password;
- (void)setPath:(NSString *)path;
- (void)setPercentEncodedFragment:(NSString *)percentEncodedFragment;
- (void)setPercentEncodedHost:(NSString *)percentEncodedHost;
- (void)setPercentEncodedPassword:(NSString *)percentEncodedPassword;
- (void)setPercentEncodedPath:(NSString *)percentEncodedPath;
- (void)setPercentEncodedQuery:(NSString *)percentEncodedQuery;
- (void)setPercentEncodedQueryItems:(NSArray *)percentEncodedQueryItems;
- (void)setPercentEncodedUser:(NSString *)percentEncodedUser;
- (void)setPort:(NSNumber *)port;
- (void)setQuery:(NSString *)query;
- (void)setQueryItems:(NSArray *)queryItems;
- (void)setScheme:(NSString *)scheme;
- (void)setUser:(NSString *)user;
@end

@implementation NSURLComponents

+ (NSURLComponents)componentsWithString:(NSString *)URLString
{
  v3 = (void *)[objc_allocWithZone((Class)a1) initWithString:URLString];

  return (NSURLComponents *)v3;
}

+ (id)_componentsWithString:(id)a3 encodingInvalidCharacters:(BOOL)a4
{
  id v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v7 = v6;
  swift_bridgeObjectRetain();
  specialized URLComponents._URLComponents.init(string:encodingInvalidCharacters:)((uint64_t)v5, v7, a4, (uint64_t)v27);
  outlined init with take of LocalePreferences?((uint64_t)v27, (uint64_t)v28, &demangling cache variable for type metadata for URLComponents._URLComponents?);
  if (_s10Foundation13URLComponentsV01_B0VSgWOg((uint64_t *)v28) == 1)
  {
    swift_bridgeObjectRelease();
    id v8 = 0;
  }
  else
  {
    long long v24 = v28[6];
    long long v25 = v28[7];
    v26[0] = v29[0];
    *(_OWORD *)((char *)v26 + 10) = *(_OWORD *)((char *)v29 + 10);
    long long v20 = v28[2];
    long long v21 = v28[3];
    long long v22 = v28[4];
    long long v23 = v28[5];
    long long v18 = v28[0];
    long long v19 = v28[1];
    v9 = (objc_class *)type metadata accessor for _NSSwiftURLComponents();
    v10 = (char *)objc_allocWithZone(v9);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<URLComponents, os_unfair_lock_s>);
    uint64_t v11 = swift_allocObject();
    *(_DWORD *)(v11 + 172) = 0;
    long long v12 = v25;
    *(_OWORD *)(v11 + 112) = v24;
    *(_OWORD *)(v11 + 128) = v12;
    *(_OWORD *)(v11 + 144) = v26[0];
    *(_OWORD *)(v11 + 154) = *(_OWORD *)((char *)v26 + 10);
    long long v13 = v21;
    *(_OWORD *)(v11 + 48) = v20;
    *(_OWORD *)(v11 + 64) = v13;
    long long v14 = v23;
    *(_OWORD *)(v11 + 80) = v22;
    *(_OWORD *)(v11 + 96) = v14;
    long long v15 = v19;
    *(_OWORD *)(v11 + 16) = v18;
    *(_OWORD *)(v11 + 32) = v15;
    *(void *)&v10[OBJC_IVAR____NSSwiftURLComponents_lock] = v11;
    v17.receiver = v10;
    v17.super_class = v9;
    id v8 = objc_msgSendSuper2(&v17, sel_init);
    swift_bridgeObjectRelease();
  }

  return v8;
}

+ (NSURLComponents)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSURLComponents == a1) {
    return (NSURLComponents *)&___immutablePlaceholderURLComponents;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSURLComponents;
  return (NSURLComponents *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSURLComponents)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSURLComponents;
  return [(NSURLComponents *)&v3 init];
}

+ (NSURLComponents)componentsWithURL:(NSURL *)url resolvingAgainstBaseURL:(BOOL)resolve
{
  uint64_t v4 = (void *)[objc_allocWithZone((Class)a1) initWithURL:url resolvingAgainstBaseURL:resolve];

  return (NSURLComponents *)v4;
}

+ (id)_componentsWithUrl:(id)a3 resolvingAgainstBaseURL:(BOOL)a4
{
  URL.init(reference:)(a3, &v8);
  uint64_t v5 = v8;
  id v6 = specialized static NSURLComponents._componentsWith(url:resolvingAgainstBaseURL:)((uint64_t)&v8, a4);

  swift_release();
  swift_release();

  return v6;
}

+ (id)_components
{
  char v8 = 1;
  v2 = (objc_class *)type metadata accessor for _NSSwiftURLComponents();
  objc_super v3 = (char *)objc_allocWithZone(v2);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<URLComponents, os_unfair_lock_s>);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 172) = 0;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 0;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  *(void *)(v4 + 104) = 0;
  *(unsigned char *)(v4 + 112) = 1;
  *(_OWORD *)(v4 + 120) = 0u;
  *(_OWORD *)(v4 + 136) = 0u;
  *(_OWORD *)(v4 + 152) = 0u;
  *(_WORD *)(v4 + 168) = 0;
  *(void *)&v3[OBJC_IVAR____NSSwiftURLComponents_lock] = v4;
  v7.receiver = v3;
  v7.super_class = v2;
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

+ (_NSRange)_matchWithString:(id)a3 requiredComponents:(unint64_t)a4 defaultValues:(id)a5 urlPtr:(id *)a6
{
  id v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;
  unint64_t v12 = specialized static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v13 = specialized static NSURLComponents._matchWith(string:requiredComponents:defaultValues:urlPtr:)((uint64_t)v9, v11, a4, v12, a6);
  NSUInteger v15 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSUInteger v16 = v13;
  NSUInteger v17 = v15;
  result.length = v17;
  result.location = v16;
  return result;
}

+ (NSURLComponents)componentsWithString:(NSString *)URLString encodingInvalidCharacters:(BOOL)encodingInvalidCharacters
{
  uint64_t v4 = (void *)[objc_allocWithZone((Class)a1) initWithString:URLString encodingInvalidCharacters:encodingInvalidCharacters];

  return (NSURLComponents *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (NSURLComponents)initWithURL:(NSURL *)url resolvingAgainstBaseURL:(BOOL)resolve
{
  id v6 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSURLComponents)initWithString:(NSString *)URLString
{
  id v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSURLComponents)initWithString:(NSString *)URLString encodingInvalidCharacters:(BOOL)encodingInvalidCharacters
{
  id v6 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSURL)URL
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSURL)URLRelativeToURL:(NSURL *)baseURL
{
  id v5 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)string
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)scheme
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setScheme:(NSString *)scheme
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)user
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setUser:(NSString *)user
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)password
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPassword:(NSString *)password
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)host
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setHost:(NSString *)host
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSNumber)port
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPort:(NSNumber *)port
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)path
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPath:(NSString *)path
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)query
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setQuery:(NSString *)query
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)fragment
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setFragment:(NSString *)fragment
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedUser
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedUser:(NSString *)percentEncodedUser
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedPassword
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedPassword:(NSString *)percentEncodedPassword
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedHost
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedHost:(NSString *)percentEncodedHost
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)encodedHost
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setEncodedHost:(NSString *)encodedHost
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedPath
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedPath:(NSString *)percentEncodedPath
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedQuery
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedQuery:(NSString *)percentEncodedQuery
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)percentEncodedFragment
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedFragment:(NSString *)percentEncodedFragment
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSRange)rangeOfScheme
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfUser
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfPassword
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfHost
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfPort
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfPath
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfQuery
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)rangeOfFragment
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSArray)queryItems
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setQueryItems:(NSArray *)queryItems
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSArray)percentEncodedQueryItems
{
  uint64_t v4 = objc_lookUpClass("NSURLComponents");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setPercentEncodedQueryItems:(NSArray *)percentEncodedQueryItems
{
  id v5 = objc_lookUpClass("NSURLComponents");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end