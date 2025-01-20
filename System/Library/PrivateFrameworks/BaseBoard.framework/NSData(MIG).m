@interface NSData(MIG)
+ (CFDataRef)bs_dataWithVMAllocatedBytes:()MIG length:;
- (uint64_t)bs_bytesForMIG;
- (unint64_t)bs_lengthForMIG;
@end

@implementation NSData(MIG)

+ (CFDataRef)bs_dataWithVMAllocatedBytes:()MIG length:
{
  CFDataRef v4 = 0;
  if (a3 && a4)
  {
    v9.version = 0;
    memset(&v9.retain, 0, 40);
    v9.info = a4;
    v9.deallocate = (CFAllocatorDeallocateCallBack)vmDeallocateCallback;
    v9.preferredSize = 0;
    CFAllocatorRef v7 = CFAllocatorCreate(0, &v9);
    CFDataRef v4 = CFDataCreateWithBytesNoCopy(0, a3, (CFIndex)a4, v7);
    CFRelease(v7);
  }
  return v4;
}

- (uint64_t)bs_bytesForMIG
{
  id v1 = a1;
  return [v1 bytes];
}

- (unint64_t)bs_lengthForMIG
{
  unint64_t v4 = [a1 length];
  if (HIDWORD(v4))
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSData+MIG.m", 39, @"length is too long : %llu", v4);
  }
  return v4;
}

@end