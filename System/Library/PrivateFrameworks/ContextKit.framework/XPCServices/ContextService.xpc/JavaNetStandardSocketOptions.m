@interface JavaNetStandardSocketOptions
+ (const)__metadata;
+ (void)initialize;
@end

@implementation JavaNetStandardSocketOptions

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaNetStandardSocketOptions_NetworkInterfaceSocketOption alloc];
    v3 = (void *)JavaNetNetworkInterface_class_();
    JreStrongAssign((id *)&v2->super.name_, @"IP_MULTICAST_IF");
    JreStrongAssign((id *)&v2->super.type_, v3);
    v2->super.socketOption_ = 31;
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_IP_MULTICAST_IF_, v2);
    v4 = sub_10022EF64(@"IP_MULTICAST_LOOP", 18);
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_IP_MULTICAST_LOOP__, v4);
    v5 = sub_10022EFC8(@"IP_MULTICAST_TTL", 17);
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_IP_MULTICAST_TTL_, v5);
    v6 = sub_10022EFC8(@"IP_TOS", 3);
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_IP_TOS_, v6);
    v7 = sub_10022EF64(@"SO_BROADCAST", 32);
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_SO_BROADCAST__, v7);
    v8 = sub_10022EF64(@"SO_KEEPALIVE", 8);
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_SO_KEEPALIVE__, v8);
    v9 = (void *)JavaLangInteger_class_();
    v10 = [JavaNetStandardSocketOptions__1 alloc];
    JreStrongAssign((id *)&v10->super.name_, @"SO_LINGER");
    JreStrongAssign((id *)&v10->super.type_, v9);
    v10->super.socketOption_ = 128;
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_SO_LINGER__, v10);
    v11 = sub_10022F02C(@"SO_RCVBUF", 4098);
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_SO_RCVBUF__, v11);
    v12 = sub_10022EF64(@"SO_REUSEADDR", 4);
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_SO_REUSEADDR__, v12);
    v13 = sub_10022F02C(@"SO_SNDBUF", 4097);
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_SO_SNDBUF__, v13);
    v14 = sub_10022EF64(@"TCP_NODELAY", 1);
    JreStrongAssignAndConsume((id *)&JavaNetStandardSocketOptions_TCP_NODELAY__, v14);
    v15 = new_JavaUtilHashSet_initWithInt_(8);
    [(JavaUtilHashSet *)v15 addWithId:JavaNetStandardSocketOptions_IP_MULTICAST_IF_];
    [(JavaUtilHashSet *)v15 addWithId:JavaNetStandardSocketOptions_IP_MULTICAST_LOOP__];
    [(JavaUtilHashSet *)v15 addWithId:JavaNetStandardSocketOptions_IP_MULTICAST_TTL_];
    [(JavaUtilHashSet *)v15 addWithId:JavaNetStandardSocketOptions_IP_TOS_];
    [(JavaUtilHashSet *)v15 addWithId:JavaNetStandardSocketOptions_SO_BROADCAST__];
    [(JavaUtilHashSet *)v15 addWithId:JavaNetStandardSocketOptions_SO_REUSEADDR__];
    [(JavaUtilHashSet *)v15 addWithId:JavaNetStandardSocketOptions_SO_RCVBUF__];
    [(JavaUtilHashSet *)v15 addWithId:JavaNetStandardSocketOptions_SO_SNDBUF__];
    v16 = JavaUtilCollections_unmodifiableSetWithJavaUtilSet_(v15);
    JreStrongAssign((id *)&JavaNetStandardSocketOptions_DATAGRAM_SOCKET_OPTIONS_, v16);
    v17 = new_JavaUtilHashSet_initWithInt_(7);
    [(JavaUtilHashSet *)v17 addWithId:JavaNetStandardSocketOptions_IP_TOS_];
    [(JavaUtilHashSet *)v17 addWithId:JavaNetStandardSocketOptions_SO_KEEPALIVE__];
    [(JavaUtilHashSet *)v17 addWithId:JavaNetStandardSocketOptions_SO_LINGER__];
    [(JavaUtilHashSet *)v17 addWithId:JavaNetStandardSocketOptions_TCP_NODELAY__];
    [(JavaUtilHashSet *)v17 addWithId:JavaNetStandardSocketOptions_SO_RCVBUF__];
    [(JavaUtilHashSet *)v17 addWithId:JavaNetStandardSocketOptions_SO_REUSEADDR__];
    [(JavaUtilHashSet *)v17 addWithId:JavaNetStandardSocketOptions_SO_SNDBUF__];
    v18 = JavaUtilCollections_unmodifiableSetWithJavaUtilSet_(v17);
    JreStrongAssign((id *)&JavaNetStandardSocketOptions_SOCKET_OPTIONS_, v18);
    v19 = new_JavaUtilHashSet_initWithInt_(2);
    [(JavaUtilHashSet *)v19 addWithId:JavaNetStandardSocketOptions_SO_RCVBUF__];
    [(JavaUtilHashSet *)v19 addWithId:JavaNetStandardSocketOptions_SO_REUSEADDR__];
    v20 = JavaUtilCollections_unmodifiableSetWithJavaUtilSet_(v19);
    JreStrongAssign((id *)&JavaNetStandardSocketOptions_SERVER_SOCKET_OPTIONS_, v20);
    atomic_store(1u, (unsigned __int8 *)JavaNetStandardSocketOptions__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100454488;
}

@end