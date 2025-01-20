@interface _GCNintendoJoyConDevice(Components)
@end

@implementation _GCNintendoJoyConDevice(Components)

- (void)propagateBattery:()Components .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "Propagating battery to the client... %@", (uint8_t *)&v2, 0xCu);
}

@end