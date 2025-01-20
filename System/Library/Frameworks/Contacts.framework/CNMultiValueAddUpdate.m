@interface CNMultiValueAddUpdate
- (BOOL)applyToABPerson:(void *)a3 abmultivalue:(void *)a4 propertyDescription:(id)a5 isUnified:(BOOL)a6 logger:(id)a7 error:(id *)a8;
- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4;
@end

@implementation CNMultiValueAddUpdate

- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4
{
  id v5 = a3;
  id v6 = [(CNMultiValueSingleUpdate *)self value];
  [v5 addObject:v6];
}

- (BOOL)applyToABPerson:(void *)a3 abmultivalue:(void *)a4 propertyDescription:(id)a5 isUnified:(BOOL)a6 logger:(id)a7 error:(id *)a8
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a7;
  v13 = [(CNMultiValueSingleUpdate *)self value];
  v14 = [v11 key];
  [v12 applyContactUpdateOfKind:"multi value add" value:v13 property:v14];

  v15 = [(CNMultiValueSingleUpdate *)self value];
  v16 = [v15 value];
  v17 = (const void *)[v11 ABMultiValueValueFromCNLabeledValueValue:v16];

  v18 = [v15 label];
  CFStringRef v19 = (const __CFString *)[v11 ABMultiValueLabelFromCNLabeledValueLabel:v18];

  CFIndex Count = ABMultiValueGetCount(a4);
  v21 = [v11 key];
  int v22 = [v21 isEqualToString:@"addressingGrammars"];

  if (!v22 || v17)
  {
    if ([(CNMultiValueUpdate *)self ignoreIdentifiers])
    {
      char inserted = ABMultiValueInsertValueAndLabelAtIndex(a4, v17, v19, Count, 0);
      uint64_t v31 = ABMultiValueCopyUUIDAtIndex();
      v32 = a8;
      if (v31)
      {
        v33 = (const void *)v31;
        +[CN addLinkedIdentifier:v31 toLabeledValue:v15];
        CFRelease(v33);
      }
    }
    else
    {
      [v15 identifier];
      char inserted = ABMultiValueInsertValueAndLabelAndUUIDAtIndex();
      v32 = a8;
    }
    if (v32 && (inserted & 1) == 0)
    {
      v48 = @"CNKeyPaths";
      v34 = [v11 key];
      v47 = v34;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      v49[0] = v35;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
      v37 = +[CNErrorFactory genericiOSABError];
      id *v32 = +[CNErrorFactory errorByAddingUserInfoEntries:v36 toError:v37];

      v38 = NSString;
      v39 = objc_msgSend(NSNumber, "numberWithBool:", -[CNMultiValueUpdate ignoreIdentifiers](self, "ignoreIdentifiers"));
      v40 = [v38 stringWithFormat:@"multi value add, ignore identifiers = %@", v39];

      id v41 = v40;
      uint64_t v42 = [v41 UTF8String];
      v43 = [(CNMultiValueSingleUpdate *)self value];
      v44 = [v11 key];
      [v12 failedToApplyContactUpdateOfKind:v42 value:v43 property:v44 error:*v32];

      char inserted = 0;
    }
  }
  else
  {
    v23 = NSString;
    v24 = objc_msgSend(NSNumber, "numberWithBool:", -[CNMultiValueUpdate ignoreIdentifiers](self, "ignoreIdentifiers"));
    v25 = [v23 stringWithFormat:@"multi value add, ignore identifiers = %@", v24];

    id v26 = v25;
    uint64_t v27 = [v26 UTF8String];
    v28 = [(CNMultiValueSingleUpdate *)self value];
    v29 = [v11 key];
    [v12 failedToApplyContactUpdateOfKind:v27 value:v28 property:v29 error:0];

    char inserted = 1;
  }

  return inserted;
}

@end