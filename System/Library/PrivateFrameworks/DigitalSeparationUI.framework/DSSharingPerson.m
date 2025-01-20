@interface DSSharingPerson
@end

@implementation DSSharingPerson

uint64_t __52__DSSharingPerson_DigitalSeparationUI__iconForTable__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 1108344832;
  uint64_t v2 = [*(id *)(a1 + 32) iconWithSize:a2];
  uint64_t v3 = iconForTable_contactLessIcon;
  iconForTable_contactLessIcon = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

uint64_t __53__DSSharingPerson_DigitalSeparationUI__iconForDetail__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 1114636288;
  uint64_t v2 = [*(id *)(a1 + 32) iconWithSize:a2];
  uint64_t v3 = iconForDetail_contactLessIcon;
  iconForDetail_contactLessIcon = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

@end