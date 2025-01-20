@interface __NSPlaceholderURLComponents
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (_NSRange)rangeOfFragment;
- (_NSRange)rangeOfHost;
- (_NSRange)rangeOfPassword;
- (_NSRange)rangeOfPath;
- (_NSRange)rangeOfPort;
- (_NSRange)rangeOfQuery;
- (_NSRange)rangeOfScheme;
- (_NSRange)rangeOfUser;
- (__NSPlaceholderURLComponents)init;
- (__NSPlaceholderURLComponents)initWithString:(id)a3;
- (__NSPlaceholderURLComponents)initWithString:(id)a3 encodingInvalidCharacters:(BOOL)a4;
- (__NSPlaceholderURLComponents)initWithURL:(id)a3 resolvingAgainstBaseURL:(BOOL)a4;
- (id)URL;
- (id)URLRelativeToURL:(id)a3;
- (id)encodedHost;
- (id)fragment;
- (id)host;
- (id)password;
- (id)path;
- (id)percentEncodedFragment;
- (id)percentEncodedHost;
- (id)percentEncodedPassword;
- (id)percentEncodedPath;
- (id)percentEncodedQuery;
- (id)percentEncodedQueryItems;
- (id)percentEncodedUser;
- (id)port;
- (id)query;
- (id)queryItems;
- (id)scheme;
- (id)string;
- (id)user;
- (unint64_t)retainCount;
- (void)setEncodedHost:(id)a3;
- (void)setFragment:(id)a3;
- (void)setHost:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPath:(id)a3;
- (void)setPercentEncodedFragment:(id)a3;
- (void)setPercentEncodedHost:(id)a3;
- (void)setPercentEncodedPassword:(id)a3;
- (void)setPercentEncodedPath:(id)a3;
- (void)setPercentEncodedQuery:(id)a3;
- (void)setPercentEncodedQueryItems:(id)a3;
- (void)setPercentEncodedUser:(id)a3;
- (void)setPort:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueryItems:(id)a3;
- (void)setScheme:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation __NSPlaceholderURLComponents

- (__NSPlaceholderURLComponents)initWithString:(id)a3 encodingInvalidCharacters:(BOOL)a4
{
  if (!a3)
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil URLString parameter", _NSMethodExceptionProem((objc_class *)-[__NSPlaceholderURLComponents superclass](self, "superclass", 0, a4), a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  id v4 = +[NSURLComponents _componentsWithString:a3 encodingInvalidCharacters:a4];

  return (__NSPlaceholderURLComponents *)v4;
}

- (__NSPlaceholderURLComponents)initWithString:(id)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil URLString parameter", _NSMethodExceptionProem((objc_class *)-[__NSPlaceholderURLComponents superclass](self, "superclass"), a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  return -[__NSPlaceholderURLComponents initWithString:encodingInvalidCharacters:](self, "initWithString:encodingInvalidCharacters:");
}

- (__NSPlaceholderURLComponents)initWithURL:(id)a3 resolvingAgainstBaseURL:(BOOL)a4
{
  if (!a3)
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil URL parameter", _NSMethodExceptionProem((objc_class *)-[__NSPlaceholderURLComponents superclass](self, "superclass", 0, a4), a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  id v4 = +[NSURLComponents _componentsWithUrl:a3 resolvingAgainstBaseURL:a4];

  return (__NSPlaceholderURLComponents *)v4;
}

- (__NSPlaceholderURLComponents)init
{
  id v2 = +[NSURLComponents _components];

  return (__NSPlaceholderURLComponents *)v2;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (id)URL
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (id)URLRelativeToURL:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)string
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (id)scheme
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setScheme:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)user
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setUser:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)password
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setPassword:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)host
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setHost:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)port
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setPort:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)path
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setPath:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)query
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setQuery:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)fragment
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setFragment:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)percentEncodedUser
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setPercentEncodedUser:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)percentEncodedPassword
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setPercentEncodedPassword:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)percentEncodedHost
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setPercentEncodedHost:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)encodedHost
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setEncodedHost:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)percentEncodedPath
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setPercentEncodedPath:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)percentEncodedQuery
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setPercentEncodedQuery:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)percentEncodedFragment
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setPercentEncodedFragment:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (_NSRange)rangeOfScheme
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (_NSRange)rangeOfUser
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (_NSRange)rangeOfPassword
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (_NSRange)rangeOfHost
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (_NSRange)rangeOfPort
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (_NSRange)rangeOfPath
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (_NSRange)rangeOfQuery
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (_NSRange)rangeOfFragment
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (id)queryItems
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setQueryItems:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)percentEncodedQueryItems
{
  id v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setPercentEncodedQueryItems:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[NSURLComponents %s]: <NSURLComponents %p> object was not initialized", sel_getName(a2), self), 0 reason userInfo];
  objc_exception_throw(v3);
}

@end