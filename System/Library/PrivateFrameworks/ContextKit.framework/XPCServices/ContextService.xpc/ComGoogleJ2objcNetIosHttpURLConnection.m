@interface ComGoogleJ2objcNetIosHttpURLConnection
+ (const)__metadata;
+ (id)getResponseStatusTextWithInt:(int)a3;
+ (void)initialize;
- (BOOL)usingProxy;
- (ComGoogleJ2objcNetIosHttpURLConnection)initWithJavaNetURL:(id)a3;
- (JavaUtilHashMap)getHeaderFieldsDoNotForceResponse;
- (id)getErrorStream;
- (id)getHeaderFieldDoNotForceResponseWithNSString:(id)a3;
- (id)getHeaderFieldKeyWithInt:(int)a3;
- (id)getHeaderFieldWithInt:(int)a3;
- (id)getHeaderFieldWithNSString:(id)a3;
- (id)getHeaderFields;
- (id)getInputStream;
- (id)getOutputStream;
- (id)getRequestProperties;
- (id)getRequestPropertyWithNSString:(id)a3;
- (id)getResponseHeaders;
- (int)getHeaderFieldIntWithNSString:(id)a3 withInt:(int)a4;
- (int)getResponseCode;
- (int64_t)getHeaderFieldDateWithNSString:(id)a3 withLong:(int64_t)a4;
- (int64_t)getHeaderFieldLongDoNotForceResponseWithNSString:(id)a3 withLong:(int64_t)a4;
- (int64_t)getHeaderFieldLongWithNSString:(id)a3 withLong:(int64_t)a4;
- (int64_t)getIfModifiedSince;
- (int64_t)headerValueToLongWithNSString:(id)a3 withLong:(int64_t)a4;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)addHeaderWithNSString:(id)a3 withNSString:(id)a4;
- (void)addRequestPropertyWithNSString:(id)a3 withNSString:(id)a4;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)getResponse;
- (void)removeHeaderWithNSString:(id)a3;
- (void)setHeaderWithNSString:(id)a3 withNSString:(id)a4;
- (void)setIfModifiedSinceWithLong:(int64_t)a3;
- (void)setRequestPropertyWithNSString:(id)a3 withNSString:(id)a4;
@end

@implementation ComGoogleJ2objcNetIosHttpURLConnection

- (ComGoogleJ2objcNetIosHttpURLConnection)initWithJavaNetURL:(id)a3
{
  JavaNetHttpURLConnection_initWithJavaNetURL_((uint64_t)self, a3);
  v4 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)&self->headers_, v4);
  return self;
}

- (void)disconnect
{
  self->super.super.connected_ = 0;
  JreStrongAssign((id *)&self->nativeRequestData_, 0);
  JreStrongAssign((id *)&self->responseDataStream_, 0);
  JreStrongAssign((id *)&self->errorDataStream_, 0);
  JreStrongAssign((id *)&self->responseException_, 0);
}

- (BOOL)usingProxy
{
  return 0;
}

- (id)getInputStream
{
  if (!self->super.super.doInput_)
  {
    v5 = new_JavaNetProtocolException_initWithNSString_(@"This protocol does not support input");
    goto LABEL_9;
  }
  int responseCode = self->super.responseCode_;
  if (responseCode == -1)
  {
    sub_10027A400((uint64_t)self);
    int responseCode = self->super.responseCode_;
  }
  if (responseCode >= 400)
  {
    url = self->super.super.url_;
    if (!url) {
      JreThrowNullPointerException();
    }
    v5 = new_JavaIoFileNotFoundException_initWithNSString_((uint64_t)[(JavaNetURL *)url description]);
LABEL_9:
    objc_exception_throw(v5);
  }
  return self->responseDataStream_;
}

- (void)connect
{
  self->super.super.connected_ = 1;
}

- (id)getHeaderFields
{
  if (self->super.responseCode_ == -1) {
    sub_10027A400((uint64_t)self);
  }
  return -[ComGoogleJ2objcNetIosHttpURLConnection getHeaderFieldsDoNotForceResponse]_0((uint64_t)self);
}

- (JavaUtilHashMap)getHeaderFieldsDoNotForceResponse
{
  v2 = new_JavaUtilHashMap_init();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = *(void **)(a1 + 136);
  if (!v3) {
LABEL_13:
  }
    JreThrowNullPointerException();
  v4 = v2;
  id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!v9) {
          goto LABEL_13;
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "getKey", (void)v14);
        id v11 = [v9 getValue];
        v12 = [(JavaUtilHashMap *)v4 getWithId:v10];
        if (!v12)
        {
          v12 = new_JavaUtilArrayList_init();
          [(JavaUtilHashMap *)v4 putWithId:v10 withId:v12];
          if (!v12) {
            goto LABEL_13;
          }
        }
        [(JavaUtilArrayList *)v12 addWithId:v11];
      }
      id v6 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)getResponseHeaders
{
  if (self->super.responseCode_ == -1) {
    sub_10027A400((uint64_t)self);
  }
  return self->headers_;
}

- (id)getHeaderFieldWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->super.responseCode_ == -1) {
    sub_10027A400((uint64_t)self);
  }
  headers = self->headers_;
  if (!headers) {
    goto LABEL_7;
  }
  if ((int)[(JavaUtilList *)headers size] > (int)v3)
  {
    id v6 = [(JavaUtilList *)headers getWithInt:v3];
    if (v6) {
      return [v6 getValue];
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  return 0;
}

- (id)getHeaderFieldWithNSString:(id)a3
{
  if (self->super.responseCode_ == -1) {
    sub_10027A400((uint64_t)self);
  }
  return sub_100279BD8((uint64_t)self, a3);
}

- (id)getHeaderFieldDoNotForceResponseWithNSString:(id)a3
{
  return sub_100279BD8((uint64_t)self, a3);
}

- (int64_t)getHeaderFieldDateWithNSString:(id)a3 withLong:(int64_t)a4
{
  id v4 = [(ComGoogleJ2objcNetIosHttpURLConnection *)self getHeaderFieldWithNSString:a3];
  id v5 = [(JavaTextDateFormat *)new_JavaTextSimpleDateFormat_initWithNSString_(off_10055F648) parseWithNSString:v4];
  if (!v5) {
    JreThrowNullPointerException();
  }
  return (int64_t)[v5 getTime];
}

- (id)getHeaderFieldKeyWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->super.responseCode_ == -1) {
    sub_10027A400((uint64_t)self);
  }
  headers = self->headers_;
  if (!headers) {
    goto LABEL_7;
  }
  if ((int)[(JavaUtilList *)headers size] > (int)v3)
  {
    id v6 = [(JavaUtilList *)headers getWithInt:v3];
    if (v6) {
      return [v6 getKey];
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  return 0;
}

- (int)getHeaderFieldIntWithNSString:(id)a3 withInt:(int)a4
{
  id v4 = [(ComGoogleJ2objcNetIosHttpURLConnection *)self getHeaderFieldWithNSString:a3];
  return JavaLangInteger_parseIntWithNSString_(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (int64_t)getHeaderFieldLongWithNSString:(id)a3 withLong:(int64_t)a4
{
  id v5 = [(ComGoogleJ2objcNetIosHttpURLConnection *)self getHeaderFieldWithNSString:a3];
  return sub_100279E48(v5, a4, v6, v7, v8, v9, v10, v11);
}

- (int64_t)getHeaderFieldLongDoNotForceResponseWithNSString:(id)a3 withLong:(int64_t)a4
{
  id v5 = sub_100279BD8((uint64_t)self, a3);
  return sub_100279E48(v5, a4, v6, v7, v8, v9, v10, v11);
}

- (int64_t)headerValueToLongWithNSString:(id)a3 withLong:(int64_t)a4
{
  return sub_100279E48(a3, a4, (uint64_t)a3, a4, v4, v5, v6, v7);
}

- (id)getRequestProperties
{
  if (self->super.super.connected_)
  {
    uint64_t v3 = new_JavaLangIllegalStateException_initWithNSString_(@"Cannot access request header fields after connection is set");
    objc_exception_throw(v3);
  }
  return -[ComGoogleJ2objcNetIosHttpURLConnection getHeaderFieldsDoNotForceResponse]_0((uint64_t)self);
}

- (void)setRequestPropertyWithNSString:(id)a3 withNSString:(id)a4
{
  if (self->super.super.connected_)
  {
    uint64_t v4 = new_JavaLangIllegalStateException_initWithNSString_(@"Cannot set request property after connection is made");
    goto LABEL_8;
  }
  if (!a3)
  {
    uint64_t v4 = new_JavaLangNullPointerException_initWithNSString_(@"field == null");
LABEL_8:
    objc_exception_throw(v4);
  }
  sub_100279F7C((uint64_t)self, a3, a4);
}

- (void)addRequestPropertyWithNSString:(id)a3 withNSString:(id)a4
{
  if (self->super.super.connected_)
  {
    uint64_t v4 = new_JavaLangIllegalStateException_initWithNSString_(@"Cannot add request property after connection is made");
    goto LABEL_8;
  }
  if (!a3)
  {
    uint64_t v4 = new_JavaLangNullPointerException_initWithNSString_(@"field == null");
LABEL_8:
    objc_exception_throw(v4);
  }
  sub_10027A134((uint64_t)self, a3, a4);
}

- (id)getRequestPropertyWithNSString:(id)a3
{
  if (a3) {
    return sub_100279BD8((uint64_t)self, a3);
  }
  else {
    return 0;
  }
}

- (id)getErrorStream
{
  return self->errorDataStream_;
}

- (int64_t)getIfModifiedSince
{
  id v2 = sub_100279BD8((uint64_t)self, @"If-Modified-Since");
  return sub_100279E48(v2, 0, v3, v4, v5, v6, v7, v8);
}

- (void)setIfModifiedSinceWithLong:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ComGoogleJ2objcNetIosHttpURLConnection;
  [(JavaNetURLConnection *)&v6 setIfModifiedSinceWithLong:a3];
  if (self->super.super.ifModifiedSince_)
  {
    uint64_t v4 = new_JavaTextSimpleDateFormat_initWithNSString_(off_10055F648);
    uint64_t v5 = [(JavaTextDateFormat *)v4 formatWithJavaUtilDate:new_JavaUtilDate_initWithLong_(self->super.super.ifModifiedSince_)];
    sub_100279F7C((uint64_t)self, @"If-Modified-Since", v5);
  }
  else
  {
    sub_10027A298((uint64_t)self, @"If-Modified-Since");
  }
}

- (id)getOutputStream
{
  if (self->super.super.connected_) {
    objc_exception_throw([[JavaLangIllegalStateException alloc] initWithNSString:@"Cannot get output stream after connection is made"]);
  }
  p_nativeRequestData = &self->nativeRequestData_;
  id result = self->nativeRequestData_;
  if (!result)
  {
    JreStrongAssign((id *)p_nativeRequestData, +[NSDataOutputStream stream]);
    return *p_nativeRequestData;
  }
  return result;
}

- (void)getResponse
{
  if (self->super.responseCode_ == -1) {
    sub_10027A400((uint64_t)self);
  }
}

- (int)getResponseCode
{
  int result = self->super.responseCode_;
  if (result == -1)
  {
    sub_10027A400((uint64_t)self);
    return self->super.responseCode_;
  }
  return result;
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  if (!self->super.instanceFollowRedirects_
    || (id v8 = a6,
        (objc_msgSend(objc_msgSend(objc_msgSend(a5, "URL", a3, a4), "scheme"), "isEqualToString:", objc_msgSend(objc_msgSend(a6, "URL"), "scheme")) & 1) == 0))
  {
    id v8 = 0;
  }
  uint64_t v9 = (void (*)(id, id))*((void *)a7 + 2);
  v9(a7, v8);
}

- (void)addHeaderWithNSString:(id)a3 withNSString:(id)a4
{
}

- (void)removeHeaderWithNSString:(id)a3
{
}

- (void)setHeaderWithNSString:(id)a3 withNSString:(id)a4
{
}

+ (id)getResponseStatusTextWithInt:(int)a3
{
  return sub_10027ACA0(a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComGoogleJ2objcNetIosHttpURLConnection;
  [(JavaNetHttpURLConnection *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = new_JavaUtilHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_100562760, v2);
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(100) withId:@"Continue"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(101) withId:@"Switching Protocols"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(102) withId:@"Processing"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(200) withId:@"OK"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(201) withId:@"Created"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(202) withId:@"Accepted"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(203) withId:@"Non Authoritative Information"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(204) withId:@"No Content"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(205) withId:@"Reset Content"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(206) withId:@"Partial Content"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(207) withId:@"Multi-Status"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(300) withId:@"Multiple Choices"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(301) withId:@"Moved Permanently"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(302) withId:@"Moved Temporarily"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(303) withId:@"See Other"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(304) withId:@"Not Modified"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(305) withId:@"Use Proxy"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(307) withId:@"Temporary Redirect"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(400) withId:@"Bad Request"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(401) withId:@"Unauthorized"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(402) withId:@"Payment Required"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(403) withId:@"Forbidden"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(404) withId:@"Not Found"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(405) withId:@"Method Not Allowed"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(406) withId:@"Not Acceptable"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(407) withId:@"Proxy Authentication Required"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(408) withId:@"Request Timeout"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(409) withId:@"Conflict"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(410) withId:@"Gone"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(411) withId:@"Length Required"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(412) withId:@"Precondition Failed"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(413) withId:@"Request Too Long"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(414) withId:@"Request-URI Too Long"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(415) withId:@"Unsupported Media Type"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(416) withId:@"Requested Range Not Satisfiable"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(417) withId:@"Expectation Failed"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(418) withId:@"Unprocessable Entity"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(419) withId:@"Insufficient Space On Resource"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(420) withId:@"Method Failure"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(423) withId:@"Locked"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(424) withId:@"Failed Dependency"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(500) withId:@"Internal Server Error"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(501) withId:@"Not Implemented"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(502) withId:@"Bad Gateway"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(503) withId:@"Service Unavailable"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(504) withId:@"Gateway Timeout"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(505) withId:@"Http Version Not Supported"];
    [(id)qword_100562760 putWithId:JavaLangInteger_valueOfWithInt_(507) withId:@"Insufficient Storage"];
    atomic_store(1u, (unsigned __int8 *)ComGoogleJ2objcNetIosHttpURLConnection__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100478D48;
}

@end