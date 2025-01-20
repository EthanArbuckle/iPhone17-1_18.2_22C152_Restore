@interface NSDateFormatter
@end

@implementation NSDateFormatter

uint64_t __66__NSDateFormatter_AppleMediaServices__ams_serverFriendlyFormatter__block_invoke()
{
  qword_1EB38E148 = objc_msgSend(MEMORY[0x1E4F28C10], "_ams_serverFriendlyFormatter");
  return MEMORY[0x1F41817F8]();
}

uint64_t __79__NSDateFormatter_AppleMediaServices__ams_serverFriendlyLocalTimeZoneFormatter__block_invoke()
{
  qword_1EB38E158 = objc_msgSend(MEMORY[0x1E4F28C10], "_ams_serverFriendlyLocalTimeZoneFormatter");
  return MEMORY[0x1F41817F8]();
}

@end