@interface CNiOSABGroupsInGroupPredicate
- (CNiOSABGroupsInGroupPredicate)initWithParentGroupIdentifier:(id)a3;
- (NSString)parentGroupIdentifier;
- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4;
@end

@implementation CNiOSABGroupsInGroupPredicate

- (CNiOSABGroupsInGroupPredicate)initWithParentGroupIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"parentGroup.identifier == %@", v4];
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABGroupsInGroupPredicate;
  v6 = [(CNPredicate *)&v10 initWithPredicate:v5];

  if (v6)
  {
    uint64_t v7 = [v4 copy];
    parentGroupIdentifier = v6->_parentGroupIdentifier;
    v6->_parentGroupIdentifier = (NSString *)v7;
  }
  return v6;
}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(CNiOSABGroupsInGroupPredicate *)self parentGroupIdentifier];
  v9[0] = v4;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  CFArrayRef v5 = (const __CFArray *)ABAddressBookCopyGroupsWithUUIDs();

  if (v5)
  {
    if (CFArrayGetCount(v5))
    {
      ValueAtIndex = (__ABGroup *)CFArrayGetValueAtIndex(v5, 0);
      CFArrayRef v7 = ABGroupCopyArrayOfAllSubgroups(ValueAtIndex);
      CFRelease(v5);
      CFArrayRef v5 = v7;
      if (!v7) {
        return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
      }
    }
  }
  return v5;
}

- (NSString)parentGroupIdentifier
{
  return self->_parentGroupIdentifier;
}

- (void).cxx_destruct
{
}

@end