@interface CNUIContactSaveConfiguration
- (BOOL)ignoresParentalRestrictions;
- (BOOL)saveWasAuthorized;
- (CNContact)contact;
- (CNContactStore)contactStore;
- (CNContainer)parentContainer;
- (CNGroup)parentGroup;
- (CNMutableContact)mutableContact;
- (CNMutableContact)shadowCopyOfReadonlyContact;
- (CNUIContactSaveConfiguration)initWithContact:(id)a3 mutableContact:(id)a4 editingLinkedContacts:(id)a5 contactStore:(id)a6 ignoresParentalRestrictions:(BOOL)a7 saveWasAuthorized:(BOOL)a8;
- (CNUIContactSaveConfiguration)initWithContact:(id)a3 mutableContact:(id)a4 shadowCopyOfReadonlyContact:(id)a5 editingLinkedContacts:(id)a6 contactStore:(id)a7 parentGroup:(id)a8 parentContainer:(id)a9 containerContext:(id)a10 groupContext:(id)a11 ignoresParentalRestrictions:(BOOL)a12 saveWasAuthorized:(BOOL)a13;
- (CNUIContainerContext)containerContext;
- (CNUIGroupContext)groupContext;
- (NSMutableArray)editingLinkedContacts;
- (id)copyWithEditingLinkedContacts:(id)a3;
@end

@implementation CNUIContactSaveConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupContext, 0);
  objc_storeStrong((id *)&self->_containerContext, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_parentGroup, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_editingLinkedContacts, 0);
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (BOOL)saveWasAuthorized
{
  return self->_saveWasAuthorized;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (CNUIGroupContext)groupContext
{
  return self->_groupContext;
}

- (CNUIContainerContext)containerContext
{
  return self->_containerContext;
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (CNGroup)parentGroup
{
  return self->_parentGroup;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSMutableArray)editingLinkedContacts
{
  return self->_editingLinkedContacts;
}

- (CNMutableContact)shadowCopyOfReadonlyContact
{
  return self->_shadowCopyOfReadonlyContact;
}

- (CNMutableContact)mutableContact
{
  return self->_mutableContact;
}

- (CNContact)contact
{
  return self->_contact;
}

- (id)copyWithEditingLinkedContacts:(id)a3
{
  id v4 = a3;
  v17 = [CNUIContactSaveConfiguration alloc];
  v16 = [(CNUIContactSaveConfiguration *)self contact];
  v5 = [(CNUIContactSaveConfiguration *)self mutableContact];
  v6 = [(CNUIContactSaveConfiguration *)self shadowCopyOfReadonlyContact];
  v7 = [(CNUIContactSaveConfiguration *)self contactStore];
  v8 = [(CNUIContactSaveConfiguration *)self parentGroup];
  v9 = [(CNUIContactSaveConfiguration *)self parentContainer];
  v10 = [(CNUIContactSaveConfiguration *)self containerContext];
  v11 = [(CNUIContactSaveConfiguration *)self groupContext];
  BOOL v12 = [(CNUIContactSaveConfiguration *)self ignoresParentalRestrictions];
  BYTE1(v15) = [(CNUIContactSaveConfiguration *)self saveWasAuthorized];
  LOBYTE(v15) = v12;
  v13 = -[CNUIContactSaveConfiguration initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:](v17, "initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:", v16, v5, v6, v4, v7, v8, v9, v10, v11, v15);

  return v13;
}

- (CNUIContactSaveConfiguration)initWithContact:(id)a3 mutableContact:(id)a4 shadowCopyOfReadonlyContact:(id)a5 editingLinkedContacts:(id)a6 contactStore:(id)a7 parentGroup:(id)a8 parentContainer:(id)a9 containerContext:(id)a10 groupContext:(id)a11 ignoresParentalRestrictions:(BOOL)a12 saveWasAuthorized:(BOOL)a13
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v20 = a11;
  v33.receiver = self;
  v33.super_class = (Class)CNUIContactSaveConfiguration;
  v21 = [(CNUIContactSaveConfiguration *)&v33 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_contact, a3);
    objc_storeStrong((id *)&v22->_mutableContact, a4);
    objc_storeStrong((id *)&v22->_shadowCopyOfReadonlyContact, a5);
    objc_storeStrong((id *)&v22->_editingLinkedContacts, a6);
    objc_storeStrong((id *)&v22->_contactStore, a7);
    objc_storeStrong((id *)&v22->_parentGroup, a8);
    objc_storeStrong((id *)&v22->_parentContainer, a9);
    objc_storeStrong((id *)&v22->_groupContext, a11);
    objc_storeStrong((id *)&v22->_containerContext, a10);
    v22->_ignoresParentalRestrictions = a12;
    v22->_saveWasAuthorized = a13;
    v23 = v22;
  }

  return v22;
}

- (CNUIContactSaveConfiguration)initWithContact:(id)a3 mutableContact:(id)a4 editingLinkedContacts:(id)a5 contactStore:(id)a6 ignoresParentalRestrictions:(BOOL)a7 saveWasAuthorized:(BOOL)a8
{
  BYTE1(v9) = a8;
  LOBYTE(v9) = a7;
  return -[CNUIContactSaveConfiguration initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:](self, "initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:", a3, a4, 0, a5, a6, 0, 0, 0, 0, v9);
}

@end