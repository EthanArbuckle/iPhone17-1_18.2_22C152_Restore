id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}