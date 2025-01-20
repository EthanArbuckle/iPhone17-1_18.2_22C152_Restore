@interface CRKASMCourseUpdateProperties
- (BOOL)areFulfilledByCourse:(id)a3;
- (NSNumber)color;
- (NSNumber)mascot;
- (NSSet)trustedUsersToAdd;
- (NSSet)trustedUsersToRemove;
- (NSSet)usersToAdd;
- (NSSet)usersToRemove;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setColor:(id)a3;
- (void)setMascot:(id)a3;
- (void)setName:(id)a3;
- (void)setTrustedUsersToAdd:(id)a3;
- (void)setTrustedUsersToRemove:(id)a3;
- (void)setUsersToAdd:(id)a3;
- (void)setUsersToRemove:(id)a3;
@end

@implementation CRKASMCourseUpdateProperties

- (NSSet)usersToAdd
{
  usersToAdd = self->_usersToAdd;
  if (!usersToAdd)
  {
    v4 = (NSSet *)objc_opt_new();
    v5 = self->_usersToAdd;
    self->_usersToAdd = v4;

    usersToAdd = self->_usersToAdd;
  }

  return usersToAdd;
}

- (NSSet)usersToRemove
{
  usersToRemove = self->_usersToRemove;
  if (!usersToRemove)
  {
    v4 = (NSSet *)objc_opt_new();
    v5 = self->_usersToRemove;
    self->_usersToRemove = v4;

    usersToRemove = self->_usersToRemove;
  }

  return usersToRemove;
}

- (NSSet)trustedUsersToAdd
{
  trustedUsersToAdd = self->_trustedUsersToAdd;
  if (!trustedUsersToAdd)
  {
    v4 = (NSSet *)objc_opt_new();
    v5 = self->_trustedUsersToAdd;
    self->_trustedUsersToAdd = v4;

    trustedUsersToAdd = self->_trustedUsersToAdd;
  }

  return trustedUsersToAdd;
}

- (NSSet)trustedUsersToRemove
{
  trustedUsersToRemove = self->_trustedUsersToRemove;
  if (!trustedUsersToRemove)
  {
    v4 = (NSSet *)objc_opt_new();
    v5 = self->_trustedUsersToRemove;
    self->_trustedUsersToRemove = v4;

    trustedUsersToRemove = self->_trustedUsersToRemove;
  }

  return trustedUsersToRemove;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CRKASMCourseUpdateProperties *)self name];
  [v4 setName:v5];

  v6 = [(CRKASMCourseUpdateProperties *)self color];
  [v4 setColor:v6];

  v7 = [(CRKASMCourseUpdateProperties *)self mascot];
  [v4 setMascot:v7];

  v8 = [(CRKASMCourseUpdateProperties *)self usersToAdd];
  [v4 setUsersToAdd:v8];

  v9 = [(CRKASMCourseUpdateProperties *)self usersToRemove];
  [v4 setUsersToRemove:v9];

  v10 = [(CRKASMCourseUpdateProperties *)self trustedUsersToAdd];
  [v4 setTrustedUsersToAdd:v10];

  v11 = [(CRKASMCourseUpdateProperties *)self trustedUsersToRemove];
  [v4 setTrustedUsersToRemove:v11];

  return v4;
}

- (BOOL)areFulfilledByCourse:(id)a3
{
  id v6 = a3;
  v7 = [(CRKASMCourseUpdateProperties *)self name];
  if (v7)
  {
    v3 = [(CRKASMCourseUpdateProperties *)self name];
    v4 = [v6 name];
    if (![v3 isEqualToString:v4])
    {
      LOBYTE(v8) = 0;
LABEL_36:

      goto LABEL_37;
    }
  }
  v9 = [(CRKASMCourseUpdateProperties *)self color];
  if (!v9
    || ([(CRKASMCourseUpdateProperties *)self color],
        v55 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v55 unsignedIntegerValue],
        v10 == [v6 color]))
  {
    v11 = [(CRKASMCourseUpdateProperties *)self mascot];
    if (v11)
    {
      v53 = [(CRKASMCourseUpdateProperties *)self mascot];
      uint64_t v12 = [v53 unsignedIntegerValue];
      if (v12 != [v6 mascot])
      {
        LOBYTE(v8) = 0;
LABEL_32:

LABEL_33:
        if (!v9) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }
    v54 = [(CRKASMCourseUpdateProperties *)self usersToAdd];
    uint64_t v13 = [v54 count];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = v13;
      v51 = [(CRKASMCourseUpdateProperties *)self usersToAdd];
      v50 = [v51 allObjects];
      v16 = __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v50, v50);
      v48 = [v6 users];
      __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v48, v48);
      v47 = v49 = v16;
      if (!objc_msgSend(v16, "isSubsetOfSet:"))
      {
        LOBYTE(v8) = 0;
LABEL_30:

LABEL_31:
        if (!v11) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      uint64_t v14 = v15;
    }
    v52 = [(CRKASMCourseUpdateProperties *)self usersToRemove];
    uint64_t v17 = [v52 count];
    uint64_t v18 = v17;
    if (v17)
    {
      uint64_t v19 = v17;
      v46 = [(CRKASMCourseUpdateProperties *)self usersToRemove];
      v45 = [v46 allObjects];
      v20 = __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v45, v45);
      v43 = [v6 users];
      __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v43, v43);
      v42 = v44 = v20;
      if (objc_msgSend(v20, "intersectsSet:"))
      {
        LOBYTE(v8) = 0;
LABEL_28:

LABEL_29:
        if (!v14) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      uint64_t v18 = v19;
    }
    v41 = [(CRKASMCourseUpdateProperties *)self trustedUsersToAdd];
    uint64_t v40 = [v41 count];
    if (!v40) {
      goto LABEL_22;
    }
    v39 = [(CRKASMCourseUpdateProperties *)self trustedUsersToAdd];
    v38 = [v39 allObjects];
    v21 = __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v38, v38);
    v36 = [v6 trustedUsers];
    __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v36, v36);
    v35 = v37 = v21;
    if (objc_msgSend(v21, "isSubsetOfSet:"))
    {
LABEL_22:
      v22 = [(CRKASMCourseUpdateProperties *)self trustedUsersToRemove];
      if ([v22 count])
      {
        v32 = [(CRKASMCourseUpdateProperties *)self trustedUsersToRemove];
        v30 = [v32 allObjects];
        __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v30, v30);
        v23 = v31 = v22;
        [v6 trustedUsers];
        v24 = v34 = v3;
        __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v24, v24);
        uint64_t v33 = v18;
        uint64_t v25 = v14;
        v26 = v11;
        v28 = v27 = v4;
        int v8 = [v23 intersectsSet:v28] ^ 1;

        v4 = v27;
        v11 = v26;
        uint64_t v14 = v25;
        uint64_t v18 = v33;

        v3 = v34;
      }
      else
      {

        LOBYTE(v8) = 1;
      }
      if (!v40)
      {
LABEL_27:

        if (!v18) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }

    goto LABEL_27;
  }
  LOBYTE(v8) = 0;
LABEL_34:

LABEL_35:
  if (v7) {
    goto LABEL_36;
  }
LABEL_37:

  return v8;
}

id __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = objc_msgSend(a2, "crk_mapUsingBlock:", &__block_literal_global_3);
  v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSNumber)mascot
{
  return self->_mascot;
}

- (void)setMascot:(id)a3
{
}

- (void)setUsersToAdd:(id)a3
{
}

- (void)setUsersToRemove:(id)a3
{
}

- (void)setTrustedUsersToAdd:(id)a3
{
}

- (void)setTrustedUsersToRemove:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedUsersToRemove, 0);
  objc_storeStrong((id *)&self->_trustedUsersToAdd, 0);
  objc_storeStrong((id *)&self->_usersToRemove, 0);
  objc_storeStrong((id *)&self->_usersToAdd, 0);
  objc_storeStrong((id *)&self->_mascot, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end