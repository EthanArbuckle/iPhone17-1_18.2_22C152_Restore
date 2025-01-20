@interface ABLog2
@end

@implementation ABLog2

void ___ABLog2_block_invoke(uint64_t a1)
{
  v2 = (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"%llx", *(void *)(a1 + 40)), "UTF8String");
  v3 = asl_new(0);
  if (v3)
  {
    v4 = v3;
    asl_set(v3, "ThreadID", v2);
    asl_set(v4, "Level", (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56)), "stringValue"), "UTF8String"));
    asl_set(v4, "Function", *(const char **)(a1 + 48));
    asl_set(v4, "Line", (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 60)), "stringValue"), "UTF8String"));
    asl_set(v4, "Message", (const char *)[*(id *)(a1 + 32) UTF8String]);
    asl_set(v4, "Category", "Debug");
    asl_set(v4, "Facility", (const char *)[@"com.apple.AddressBookLegacy" UTF8String]);
    asl_send((asl_object_t)__ABLogAslClient, v4);
    JUMPOUT(0x19F3B4300);
  }
  NSLog(&cfstr_ErrorCreatingN.isa, *(void *)(a1 + 32));
}

@end