@interface NSUserActivity
@end

@implementation NSUserActivity

void __40__NSUserActivity_MKMapItem__setMapItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 dictionaryRepresentation];
  uint64_t v11 = 0;
  v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:200 options:0 error:&v11];
  if (!v10) {
    NSLog(&cfstr_FailedToSerial_1.isa, v11);
  }
  (*((void (**)(id, id, void *, void, void))v8 + 2))(v8, v7, v10, 0, 0);
}

@end