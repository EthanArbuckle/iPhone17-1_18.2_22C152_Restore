uint64_t sub_377C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_top10Hits(void *a1, const char *a2, ...)
{
  return [a1 top10Hits];
}

id objc_msgSend_top1Hits(void *a1, const char *a2, ...)
{
  return [a1 top1Hits];
}

id objc_msgSend_top3Hits(void *a1, const char *a2, ...)
{
  return [a1 top3Hits];
}

id objc_msgSend_top5Hits(void *a1, const char *a2, ...)
{
  return [a1 top5Hits];
}

id objc_msgSend_totalPredictionIntervals(void *a1, const char *a2, ...)
{
  return [a1 totalPredictionIntervals];
}