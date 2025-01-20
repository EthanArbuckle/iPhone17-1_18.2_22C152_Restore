@interface NSObject(HFDebugging)
- (id)hf_prettyDescriptionWithDetailLevel:()HFDebugging;
- (uint64_t)hf_prettyDescription;
- (uint64_t)hf_prettyExpensiveDescription;
- (uint64_t)hf_prettyFullDescription;
@end

@implementation NSObject(HFDebugging)

- (id)hf_prettyDescriptionWithDetailLevel:()HFDebugging
{
  if (+[HFUtilities hasInternalDiagnostics]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = +[HFStateDumpBuilderContext contextWithDetailLevel:a3];
    v6 = objc_msgSend(a1, "hf_stateDumpBuilderWithContext:", v5);
    v7 = [v6 buildDescription];
  }
  else
  {
    v7 = [a1 description];
  }
  return v7;
}

- (uint64_t)hf_prettyDescription
{
  return objc_msgSend(a1, "hf_prettyDescriptionWithDetailLevel:", 0);
}

- (uint64_t)hf_prettyExpensiveDescription
{
  return objc_msgSend(a1, "hf_prettyDescriptionWithDetailLevel:", 1);
}

- (uint64_t)hf_prettyFullDescription
{
  return objc_msgSend(a1, "hf_prettyDescriptionWithDetailLevel:", 2);
}

@end