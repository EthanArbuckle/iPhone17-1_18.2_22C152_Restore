@interface OrgApacheLuceneUtilBitUtil
+ (int)bitCountWithByte:(char)a3;
+ (int)bitListWithByte:(char)a3;
+ (int)nextHighestPowerOfTwoWithInt:(int)a3;
+ (int)zigZagDecodeWithInt:(int)a3;
+ (int)zigZagEncodeWithInt:(int)a3;
+ (int64_t)deinterleaveWithLong:(int64_t)a3;
+ (int64_t)flipFlopWithLong:(int64_t)a3;
+ (int64_t)interleaveWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (int64_t)nextHighestPowerOfTwoWithLong:(int64_t)a3;
+ (int64_t)pop_andnotWithLongArray:(id)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (int64_t)pop_arrayWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int64_t)pop_intersectWithLongArray:(id)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (int64_t)pop_unionWithLongArray:(id)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (int64_t)pop_xorWithLongArray:(id)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (int64_t)zigZagDecodeWithLong:(int64_t)a3;
+ (int64_t)zigZagEncodeWithLong:(int64_t)a3;
+ (void)initialize;
@end

@implementation OrgApacheLuceneUtilBitUtil

+ (int)bitCountWithByte:(char)a3
{
  return OrgApacheLuceneUtilBitUtil_bitCountWithByte_(a3);
}

+ (int)bitListWithByte:(char)a3
{
  return OrgApacheLuceneUtilBitUtil_bitListWithByte_(a3);
}

+ (int64_t)pop_arrayWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilBitUtil_pop_arrayWithLongArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (int64_t)pop_intersectWithLongArray:(id)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return OrgApacheLuceneUtilBitUtil_pop_intersectWithLongArray_withLongArray_withInt_withInt_((uint64_t)a3, (uint64_t)a4, a5, a6);
}

+ (int64_t)pop_unionWithLongArray:(id)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return OrgApacheLuceneUtilBitUtil_pop_unionWithLongArray_withLongArray_withInt_withInt_((uint64_t)a3, (uint64_t)a4, a5, a6);
}

+ (int64_t)pop_andnotWithLongArray:(id)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return OrgApacheLuceneUtilBitUtil_pop_andnotWithLongArray_withLongArray_withInt_withInt_((uint64_t)a3, (uint64_t)a4, a5, a6);
}

+ (int64_t)pop_xorWithLongArray:(id)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return OrgApacheLuceneUtilBitUtil_pop_xorWithLongArray_withLongArray_withInt_withInt_((uint64_t)a3, (uint64_t)a4, a5, a6);
}

+ (int)nextHighestPowerOfTwoWithInt:(int)a3
{
  return OrgApacheLuceneUtilBitUtil_nextHighestPowerOfTwoWithInt_(a3);
}

+ (int64_t)nextHighestPowerOfTwoWithLong:(int64_t)a3
{
  return OrgApacheLuceneUtilBitUtil_nextHighestPowerOfTwoWithLong_(a3);
}

+ (int64_t)interleaveWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  return OrgApacheLuceneUtilBitUtil_interleaveWithLong_withLong_(a3, a4);
}

+ (int64_t)deinterleaveWithLong:(int64_t)a3
{
  return OrgApacheLuceneUtilBitUtil_deinterleaveWithLong_(a3);
}

+ (int64_t)flipFlopWithLong:(int64_t)a3
{
  return OrgApacheLuceneUtilBitUtil_flipFlopWithLong_(a3);
}

+ (int)zigZagEncodeWithInt:(int)a3
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilBitUtil__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (a3 >> 31) ^ (2 * a3);
}

+ (int64_t)zigZagEncodeWithLong:(int64_t)a3
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilBitUtil__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (a3 >> 63) ^ (2 * a3);
}

+ (int)zigZagDecodeWithInt:(int)a3
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilBitUtil__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return -(a3 & 1) ^ (a3 >> 1);
}

+ (int64_t)zigZagDecodeWithLong:(int64_t)a3
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilBitUtil__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return -(a3 & 1) ^ ((unint64_t)a3 >> 1);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v7[12] = xmmword_10031F4C8;
    v7[13] = unk_10031F4D8;
    v7[14] = xmmword_10031F4E8;
    v7[15] = unk_10031F4F8;
    v7[8] = xmmword_10031F488;
    v7[9] = unk_10031F498;
    v7[10] = xmmword_10031F4A8;
    v7[11] = unk_10031F4B8;
    v7[4] = xmmword_10031F448;
    v7[5] = unk_10031F458;
    v7[6] = xmmword_10031F468;
    v7[7] = unk_10031F478;
    v7[0] = xmmword_10031F408;
    v7[1] = unk_10031F418;
    v7[2] = xmmword_10031F428;
    v7[3] = unk_10031F438;
    JreStrongAssignAndConsume((id *)&qword_10055FD90, +[IOSByteArray newArrayWithBytes:v7 count:256]);
    memcpy(__dst, &unk_10031F508, sizeof(__dst));
    JreStrongAssignAndConsume((id *)&qword_10055FD98, +[IOSIntArray newArrayWithInts:__dst count:256]);
    unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
    v4[0] = xmmword_10031F908;
    v4[1] = unk_10031F918;
    v4[2] = xmmword_10031F928;
    JreStrongAssignAndConsume((id *)&qword_10055FDA0, +[IOSLongArray newArrayWithLongs:v4 count:7]);
    uint64_t v2 = 0x8000400020001;
    __int16 v3 = 16;
    JreStrongAssignAndConsume((id *)&qword_10055FDA8, +[IOSShortArray newArrayWithShorts:&v2 count:5]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilBitUtil__initialized);
  }
}

@end