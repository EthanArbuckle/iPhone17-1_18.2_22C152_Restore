@interface WebKit
@end

@implementation WebKit

BOOL __client_is_WebKit_block_invoke()
{
  BOOL result = process_matches_target((BOOL)"com.apple.WebKit");
  client_is_WebKit_is_WebKit = result;
  return result;
}

@end