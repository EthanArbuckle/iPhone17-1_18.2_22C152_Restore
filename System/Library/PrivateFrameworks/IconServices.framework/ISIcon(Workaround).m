@interface ISIcon(Workaround)
@end

@implementation ISIcon(Workaround)

- (void)_prepareImageForImageDescriptor:()Workaround .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ISIcon(Workaround) _prepareImageForImageDescriptor:]";
  _os_log_fault_impl(&dword_1AE771000, log, OS_LOG_TYPE_FAULT, "Unauthorized use of internal IS implementation: %s. Returning generic app icon data.", (uint8_t *)&v1, 0xCu);
}

@end