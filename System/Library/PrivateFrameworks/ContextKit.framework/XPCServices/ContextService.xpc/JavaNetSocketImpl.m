@interface JavaNetSocketImpl
+ (const)__metadata;
- (BOOL)supportsUrgentData;
- (NSString)description;
- (id)getFD$;
- (id)getFileDescriptor;
- (id)getInetAddress;
- (id)getInputStream;
- (id)getOutputStream;
- (int)available;
- (int)getLocalPort;
- (int)getPort;
- (void)acceptWithJavaNetSocketImpl:(id)a3;
- (void)bindWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)close;
- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)connectWithJavaNetSocketAddress:(id)a3 withInt:(int)a4;
- (void)connectWithNSString:(id)a3 withInt:(int)a4;
- (void)createWithBoolean:(BOOL)a3;
- (void)dealloc;
- (void)listenWithInt:(int)a3;
- (void)sendUrgentDataWithInt:(int)a3;
- (void)shutdownInput;
- (void)shutdownOutput;
@end

@implementation JavaNetSocketImpl

- (void)acceptWithJavaNetSocketImpl:(id)a3
{
}

- (int)available
{
  return 0;
}

- (void)bindWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
}

- (void)close
{
}

- (void)connectWithNSString:(id)a3 withInt:(int)a4
{
}

- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
}

- (void)createWithBoolean:(BOOL)a3
{
}

- (id)getFileDescriptor
{
  return self->fd_;
}

- (id)getFD$
{
  return self->fd_;
}

- (id)getInetAddress
{
  return self->address_;
}

- (id)getInputStream
{
  return 0;
}

- (int)getLocalPort
{
  return self->localport_;
}

- (id)getOutputStream
{
  return 0;
}

- (int)getPort
{
  return self->port_;
}

- (void)listenWithInt:(int)a3
{
}

- (NSString)description
{
  [(JavaNetSocketImpl *)self getInetAddress];
  [(JavaNetSocketImpl *)self getLocalPort];
  return (NSString *)JreStrcat("$@$I$IC", v3, v4, v5, v6, v7, v8, v9, @"Socket[address=");
}

- (void)shutdownInput
{
  v2 = new_JavaIoIOException_initWithNSString_(@"Method has not been implemented");
  objc_exception_throw(v2);
}

- (void)shutdownOutput
{
  v2 = new_JavaIoIOException_initWithNSString_(@"Method has not been implemented");
  objc_exception_throw(v2);
}

- (void)connectWithJavaNetSocketAddress:(id)a3 withInt:(int)a4
{
}

- (BOOL)supportsUrgentData
{
  return 0;
}

- (void)sendUrgentDataWithInt:(int)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetSocketImpl;
  [(JavaNetSocketImpl *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043FF28;
}

@end