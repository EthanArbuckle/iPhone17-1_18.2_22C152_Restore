id GKAchievementDescription.rarityPercent.getter()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(v0, sel_rarityPercent);
  v2 = result;
  if (result)
  {
    objc_msgSend(result, sel_doubleValue);
    v4 = v3;

    return (id)v4;
  }
  return result;
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}