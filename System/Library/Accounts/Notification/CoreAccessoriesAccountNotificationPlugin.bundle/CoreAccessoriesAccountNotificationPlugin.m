uint64_t MFi4AuthFeatureGroup()
{
  return _MFi4AuthFeatureGroup();
}

id objc_msgSend_aa_isAccountClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_isAccountClass:");
}
nPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  if (!a3 && a4 == 3 && objc_msgSend(a6, "aa_isAccountClass:", AAAccountClassPrimary, *(void *)&a4, a5))
  {
    uint64_t v6 = MFi4AuthFeatureGroup();
    _DeleteAllSynchronizableFeatureKeysForFeature(0, v6, 0);
  }
}

@end