@interface _CDEventDictsForContactsState
- (id)initWithMngr:(void *)a3 me:(void *)a4 relationshipContacts:(void *)a5 avgOfAllCalls:(void *)a6 emergencyFamilyContacts:(void *)a7 emergencyContacts:(void *)a8 contactParents:(void *)a9 photosContactIds:(void *)a10 airDropDict:(void *)a11 airDropDictAtHome:(void *)a12 homeContacts:;
@end

@implementation _CDEventDictsForContactsState

- (id)initWithMngr:(void *)a3 me:(void *)a4 relationshipContacts:(void *)a5 avgOfAllCalls:(void *)a6 emergencyFamilyContacts:(void *)a7 emergencyContacts:(void *)a8 contactParents:(void *)a9 photosContactIds:(void *)a10 airDropDict:(void *)a11 airDropDictAtHome:(void *)a12 homeContacts:
{
  id v54 = a2;
  id v53 = a3;
  id v19 = a4;
  id v50 = a5;
  id v52 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v51 = a11;
  id v25 = a12;
  v55 = v19;
  if (a1
    && (v56.receiver = a1,
        v56.super_class = (Class)_CDEventDictsForContactsState,
        v26 = (id *)objc_msgSendSuper2(&v56, sel_init),
        (a1 = v26) != 0))
  {
    objc_storeStrong(v26 + 1, a2);
    objc_storeStrong(a1 + 2, a3);
    uint64_t v27 = [v19 copy];
    id v28 = a1[3];
    a1[3] = (id)v27;

    objc_storeStrong(a1 + 4, v50);
    uint64_t v29 = [v20 copy];
    id v30 = a1[5];
    a1[5] = (id)v29;

    uint64_t v31 = [v21 copy];
    id v32 = a1[6];
    a1[6] = (id)v31;

    uint64_t v33 = [v22 copy];
    id v34 = a1[7];
    a1[7] = (id)v33;

    uint64_t v35 = [v23 copy];
    id v36 = a1[8];
    a1[8] = (id)v35;

    uint64_t v37 = [v24 copy];
    id v38 = a1[9];
    a1[9] = (id)v37;

    v39 = v51;
    uint64_t v40 = [v51 copy];
    id v41 = a1[10];
    a1[10] = (id)v40;

    uint64_t v42 = [v25 copy];
    id v43 = a1[11];
    a1[11] = (id)v42;

    v44 = v25;
    v45 = v53;
    v46 = v54;
    v47 = v52;
  }
  else
  {
    v44 = v25;
    v45 = v53;
    v46 = v54;
    v39 = v51;
    v47 = v52;
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeContacts, 0);
  objc_storeStrong((id *)&self->_airDropDictAtHome, 0);
  objc_storeStrong((id *)&self->_airDropDict, 0);
  objc_storeStrong((id *)&self->_photosContactIds, 0);
  objc_storeStrong((id *)&self->_contactParents, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_emergencyFamilyContacts, 0);
  objc_storeStrong((id *)&self->_avgOfAllCalls, 0);
  objc_storeStrong((id *)&self->_relationshipContacts, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_mngr, 0);
}

@end