@interface LibcoreIoStreams
+ (const)__metadata;
+ (id)readAsciiLineWithJavaIoInputStream:(id)a3;
+ (id)readFullyNoCloseWithJavaIoInputStream:(id)a3;
+ (id)readFullyWithJavaIoInputStream:(id)a3;
+ (id)readFullyWithJavaIoReader:(id)a3;
+ (int)copy__WithJavaIoInputStream:(id)a3 withJavaIoOutputStream:(id)a4;
+ (int)readSingleByteWithJavaIoInputStream:(id)a3;
+ (int64_t)skipByReadingWithJavaIoInputStream:(id)a3 withLong:(int64_t)a4;
+ (void)initialize;
+ (void)readFullyWithJavaIoInputStream:(id)a3 withByteArray:(id)a4;
+ (void)readFullyWithJavaIoInputStream:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)skipAllWithJavaIoInputStream:(id)a3;
+ (void)writeSingleByteWithJavaIoOutputStream:(id)a3 withInt:(int)a4;
@end

@implementation LibcoreIoStreams

+ (int)readSingleByteWithJavaIoInputStream:(id)a3
{
  return LibcoreIoStreams_readSingleByteWithJavaIoInputStream_(a3);
}

+ (void)writeSingleByteWithJavaIoOutputStream:(id)a3 withInt:(int)a4
{
}

+ (void)readFullyWithJavaIoInputStream:(id)a3 withByteArray:(id)a4
{
}

+ (void)readFullyWithJavaIoInputStream:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
}

+ (id)readFullyWithJavaIoInputStream:(id)a3
{
  return LibcoreIoStreams_readFullyWithJavaIoInputStream_(a3);
}

+ (id)readFullyNoCloseWithJavaIoInputStream:(id)a3
{
  return LibcoreIoStreams_readFullyNoCloseWithJavaIoInputStream_(a3);
}

+ (id)readFullyWithJavaIoReader:(id)a3
{
  return LibcoreIoStreams_readFullyWithJavaIoReader_(a3);
}

+ (void)skipAllWithJavaIoInputStream:(id)a3
{
}

+ (int64_t)skipByReadingWithJavaIoInputStream:(id)a3 withLong:(int64_t)a4
{
  return LibcoreIoStreams_skipByReadingWithJavaIoInputStream_withLong_(a3, a4);
}

+ (int)copy__WithJavaIoInputStream:(id)a3 withJavaIoOutputStream:(id)a4
{
  return LibcoreIoStreams_copy__WithJavaIoInputStream_withJavaIoOutputStream_(a3, a4);
}

+ (id)readAsciiLineWithJavaIoInputStream:(id)a3
{
  return LibcoreIoStreams_readAsciiLineWithJavaIoInputStream_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilConcurrentAtomicAtomicReference_init();
    JreStrongAssignAndConsume((id *)&qword_100562E50, v2);
    atomic_store(1u, (unsigned __int8 *)&LibcoreIoStreams__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047FF58;
}

@end