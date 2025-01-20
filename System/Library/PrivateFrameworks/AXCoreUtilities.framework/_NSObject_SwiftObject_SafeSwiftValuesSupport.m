@interface _NSObject_SwiftObject_SafeSwiftValuesSupport
- (BOOL)safeSwiftBoolForKey:(id)a3;
- (CGPoint)safeSwiftCGPointForKey:(id)a3;
- (CGRect)safeSwiftCGRectForKey:(id)a3;
- (CGSize)safeSwiftCGSizeForKey:(id)a3;
- (char)safeSwiftInt8ForKey:(id)a3;
- (double)safeSwiftCGFloatForKey:(id)a3;
- (double)safeSwiftDoubleForKey:(id)a3;
- (float)safeSwiftFloatForKey:(id)a3;
- (id)safeSwiftArrayForKey:(id)a3;
- (id)safeSwiftDictionaryForKey:(id)a3;
- (id)safeSwiftOptionalBoolForKey:(id)a3;
- (id)safeSwiftOptionalCGFloatForKey:(id)a3;
- (id)safeSwiftOptionalCGPointForKey:(id)a3;
- (id)safeSwiftOptionalCGRectForKey:(id)a3;
- (id)safeSwiftOptionalCGSizeForKey:(id)a3;
- (id)safeSwiftOptionalDoubleForKey:(id)a3;
- (id)safeSwiftOptionalFloatForKey:(id)a3;
- (id)safeSwiftOptionalInt16ForKey:(id)a3;
- (id)safeSwiftOptionalInt32ForKey:(id)a3;
- (id)safeSwiftOptionalInt64ForKey:(id)a3;
- (id)safeSwiftOptionalInt8ForKey:(id)a3;
- (id)safeSwiftOptionalIntForKey:(id)a3;
- (id)safeSwiftOptionalUInt16ForKey:(id)a3;
- (id)safeSwiftOptionalUInt32ForKey:(id)a3;
- (id)safeSwiftOptionalUInt64ForKey:(id)a3;
- (id)safeSwiftOptionalUInt8ForKey:(id)a3;
- (id)safeSwiftOptionalUIntForKey:(id)a3;
- (id)safeSwiftSetForKey:(id)a3;
- (id)safeSwiftStringForKey:(id)a3;
- (id)safeSwiftValueForKey:(id)a3;
- (int)safeSwiftInt32ForKey:(id)a3;
- (int64_t)safeSwiftInt64ForKey:(id)a3;
- (int64_t)safeSwiftIntForKey:(id)a3;
- (signed)safeSwiftInt16ForKey:(id)a3;
- (unint64_t)safeSwiftUInt64ForKey:(id)a3;
- (unint64_t)safeSwiftUIntForKey:(id)a3;
- (unsigned)safeSwiftUInt16ForKey:(id)a3;
- (unsigned)safeSwiftUInt32ForKey:(id)a3;
- (unsigned)safeSwiftUInt8ForKey:(id)a3;
- (void)safeSwiftCallAsFunction:(id)a3;
@end

@implementation _NSObject_SwiftObject_SafeSwiftValuesSupport

- (BOOL)safeSwiftBoolForKey:(id)a3
{
  return _AXSafeSwiftBoolForKey(self);
}

- (int64_t)safeSwiftIntForKey:(id)a3
{
  return _AXSafeSwiftIntForKey(self, (uint64_t)a3);
}

- (unint64_t)safeSwiftUIntForKey:(id)a3
{
  return _AXSafeSwiftUIntForKey(self, (uint64_t)a3);
}

- (char)safeSwiftInt8ForKey:(id)a3
{
  return _AXSafeSwiftInt8ForKey(self);
}

- (unsigned)safeSwiftUInt8ForKey:(id)a3
{
  return _AXSafeSwiftUInt8ForKey(self);
}

- (signed)safeSwiftInt16ForKey:(id)a3
{
  return _AXSafeSwiftInt16ForKey(self);
}

- (unsigned)safeSwiftUInt16ForKey:(id)a3
{
  return _AXSafeSwiftUInt16ForKey(self);
}

- (int)safeSwiftInt32ForKey:(id)a3
{
  return _AXSafeSwiftInt32ForKey(self, (uint64_t)a3);
}

- (unsigned)safeSwiftUInt32ForKey:(id)a3
{
  return _AXSafeSwiftUInt32ForKey(self, (uint64_t)a3);
}

- (int64_t)safeSwiftInt64ForKey:(id)a3
{
  return _AXSafeSwiftInt64ForKey(self, (uint64_t)a3);
}

- (unint64_t)safeSwiftUInt64ForKey:(id)a3
{
  return _AXSafeSwiftUInt64ForKey(self, (uint64_t)a3);
}

- (float)safeSwiftFloatForKey:(id)a3
{
  return _AXSafeSwiftFloatForKey(self);
}

- (double)safeSwiftDoubleForKey:(id)a3
{
  return _AXSafeSwiftDoubleForKey(self);
}

- (double)safeSwiftCGFloatForKey:(id)a3
{
  return _AXSafeSwiftCGFloatForKey(self);
}

- (CGPoint)safeSwiftCGPointForKey:(id)a3
{
  double v3 = _AXSafeSwiftCGPointForKey(self, (uint64_t)a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)safeSwiftCGSizeForKey:(id)a3
{
  double v3 = _AXSafeSwiftCGSizeForKey(self, (uint64_t)a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)safeSwiftCGRectForKey:(id)a3
{
  _AXSafeSwiftCGRectForKey(self);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)safeSwiftOptionalBoolForKey:(id)a3
{
  return _AXSafeSwiftOptionalBoolForKey((uint64_t)self, (uint64_t)a3);
}

- (id)safeSwiftOptionalIntForKey:(id)a3
{
  return _AXSafeSwiftOptionalIntForKey();
}

- (id)safeSwiftOptionalUIntForKey:(id)a3
{
  return _AXSafeSwiftOptionalUIntForKey();
}

- (id)safeSwiftOptionalInt8ForKey:(id)a3
{
  return _AXSafeSwiftOptionalInt8ForKey();
}

- (id)safeSwiftOptionalUInt8ForKey:(id)a3
{
  return _AXSafeSwiftOptionalUInt8ForKey();
}

- (id)safeSwiftOptionalInt16ForKey:(id)a3
{
  return _AXSafeSwiftOptionalInt16ForKey();
}

- (id)safeSwiftOptionalUInt16ForKey:(id)a3
{
  return _AXSafeSwiftOptionalUInt16ForKey();
}

- (id)safeSwiftOptionalInt32ForKey:(id)a3
{
  return _AXSafeSwiftOptionalInt32ForKey();
}

- (id)safeSwiftOptionalUInt32ForKey:(id)a3
{
  return _AXSafeSwiftOptionalUInt32ForKey();
}

- (id)safeSwiftOptionalInt64ForKey:(id)a3
{
  return _AXSafeSwiftOptionalInt64ForKey();
}

- (id)safeSwiftOptionalUInt64ForKey:(id)a3
{
  return _AXSafeSwiftOptionalUInt64ForKey();
}

- (id)safeSwiftOptionalFloatForKey:(id)a3
{
  return _AXSafeSwiftOptionalFloatForKey();
}

- (id)safeSwiftOptionalDoubleForKey:(id)a3
{
  return _AXSafeSwiftOptionalDoubleForKey();
}

- (id)safeSwiftOptionalCGFloatForKey:(id)a3
{
  return _AXSafeSwiftOptionalCGFloatForKey();
}

- (id)safeSwiftOptionalCGPointForKey:(id)a3
{
  return _AXSafeSwiftOptionalCGPointForKey();
}

- (id)safeSwiftOptionalCGSizeForKey:(id)a3
{
  return _AXSafeSwiftOptionalCGSizeForKey();
}

- (id)safeSwiftOptionalCGRectForKey:(id)a3
{
  return _AXSafeSwiftOptionalCGRectForKey((uint64_t)self, (uint64_t)a3);
}

- (id)safeSwiftStringForKey:(id)a3
{
  return _AXSafeSwiftStringForKey(self);
}

- (id)safeSwiftArrayForKey:(id)a3
{
  return _AXSafeSwiftArrayForKey(self, (uint64_t)a3);
}

- (id)safeSwiftSetForKey:(id)a3
{
  return _AXSafeSwiftSetForKey(self, (uint64_t)a3);
}

- (id)safeSwiftDictionaryForKey:(id)a3
{
  return _AXSafeSwiftDictionaryForKey(self, (uint64_t)a3);
}

- (id)safeSwiftValueForKey:(id)a3
{
  return _AXSafeSwiftValueForKey(self, (uint64_t)a3);
}

- (void)safeSwiftCallAsFunction:(id)a3
{
}

@end