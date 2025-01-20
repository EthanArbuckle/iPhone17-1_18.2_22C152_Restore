@interface String:
- (uint64_t)AccessibilityCustomAttributes.Value;
- (uint64_t)CGFloat;
- (uint64_t)Double;
- (unint64_t)AccessibilityCustomAttributes.Value;
- (unint64_t)String;
- (void)AccessibilityCustomAttributes.Value;
- (void)Any;
- (void)CGFloat;
- (void)Double;
- (void)String;
@end

@implementation String:

- (void)CGFloat
{
}

- (void)Any
{
  if (!lazy cache variable for type metadata for [String : Any])
  {
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [String : Any]);
    }
  }
}

- (uint64_t)AccessibilityCustomAttributes.Value
{
  type metadata accessor for [String : AccessibilityCustomAttributes.Value].Index._Variant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

- (void)Double
{
  if (!lazy cache variable for type metadata for JSONCodable<[String : Double]>)
  {
    type metadata accessor for [Int : CGFloat](255, &lazy cache variable for type metadata for [String : Double]);
    unint64_t v0 = type metadata accessor for JSONCodable();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for JSONCodable<[String : Double]>);
    }
  }
}

- (uint64_t)Double
{
  return lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type JSONCodable<[String : Double]> and conformance JSONCodable<A>, (void (*)(uint64_t))type metadata accessor for JSONCodable<[String : Double]>);
}

- (unint64_t)AccessibilityCustomAttributes.Value
{
  unint64_t result = lazy protocol witness table cache variable for type [String : AccessibilityCustomAttributes.Value].Index and conformance [A : B].Index;
  if (!lazy protocol witness table cache variable for type [String : AccessibilityCustomAttributes.Value].Index and conformance [A : B].Index)
  {
    type metadata accessor for [String : AccessibilityCustomAttributes.Value](255, &lazy cache variable for type metadata for [String : AccessibilityCustomAttributes.Value].Index, MEMORY[0x263F8D008]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : AccessibilityCustomAttributes.Value].Index and conformance [A : B].Index);
  }
  return result;
}

- (void)AccessibilityCustomAttributes.Value
{
  if (!lazy cache variable for type metadata for [String : AccessibilityCustomAttributes.Value].Index._Variant)
  {
    type metadata accessor for AccessibilityCustomAttributes.Value();
    unint64_t v0 = type metadata accessor for Dictionary.Index._Variant();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [String : AccessibilityCustomAttributes.Value].Index._Variant);
    }
  }
}

- (void)String
{
  if (!lazy cache variable for type metadata for [String : String])
  {
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [String : String]);
    }
  }
}

- (unint64_t)String
{
  unint64_t result = lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B])
  {
    type metadata accessor for [String : String]();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
  }
  return result;
}

- (uint64_t)CGFloat
{
  return lazy protocol witness table accessor for type LinkDestination.Configuration and conformance LinkDestination.Configuration(&lazy protocol witness table cache variable for type JSONCodable<[String : CGFloat]> and conformance JSONCodable<A>, type metadata accessor for JSONCodable<[String : CGFloat]>);
}

@end