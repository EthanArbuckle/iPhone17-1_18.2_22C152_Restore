@interface NSSQLRow
+ (id)allocWithZone:(_NSZone *)a3;
+ (unsigned)newBatchRowAllocation:(id *)a3 count:(unsigned int)a4 forSQLEntity:(id)a5 withOwnedObjectIDs:(id *)a6 andTimestamp:(double)a7;
+ (void)allocForSQLEntity:(uint64_t)a1;
+ (void)initialize;
- (BOOL)hasUniqueConstraintDiffFrom:(const __CFBitVector *)a1;
- (BOOL)isEqual:(id)a3;
- (CFBitVectorRef)newColumnMaskFrom:(uint64_t)a3 columnInclusionOptions:;
- (CFDateRef)attributeValueForSlot:(CFDateRef)result;
- (NSSQLRow)initWithSQLEntity:(id)a3 objectID:(id)a4;
- (NSSQLRow)initWithSQLEntity:(id)a3 ownedObjectID:(id)a4 andTimestamp:(double)a5;
- (const)knownKeyValuesPointer;
- (id)_snapshot_;
- (id)copy;
- (id)description;
- (id)newObjectIDForToOne:(id)a3;
- (id)objectID;
- (id)valueForKey:(id)a3;
- (uint64_t)_validateToOnes;
- (uint64_t)foreignKeyForSlot:(uint64_t)result;
- (unint64_t)version;
- (unsigned)_versionNumber;
- (void)setForeignEntityKeySlot:(unsigned int)a3 entityKey:(unsigned int)a4;
- (void)setForeignKeySlot:(unsigned int)a3 int64:(int64_t)a4;
- (void)setForeignOrderKeySlot:(unsigned int)a3 orderKey:(unsigned int)a4;
- (void)setObjectID:(id)a3;
- (void)setOptLock:(int64_t)a3;
@end

@implementation NSSQLRow

- (const)knownKeyValuesPointer
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->super._invalidToOnes);
  if (v2) {
    -[NSSQLRow _validateToOnes]((uint64_t)self);
  }
  return 0;
}

- (void)setForeignKeySlot:(unsigned int)a3 int64:(int64_t)a4
{
  atomic_store(1u, (unsigned __int8 *)&self->super._invalidToOnes);
  snapshot = self->_snapshot;
  uint64_t v8 = (uint64_t)[(NSManagedObjectID *)snapshot->_cd_objectID entity][112];
  unint64_t v9 = *(void *)(v8 + 104);
  BOOL v10 = a3 >= v9;
  unint64_t v11 = a3 - v9;
  if (v10)
  {
    *(Class *)((char *)&self->super.super.isa + 8 * v11 + _NSSQLRowInstanceSize) = (Class)a4;
  }
  else
  {
    uint64_t v12 = *(void *)(v8 + 96);
    if (a4)
    {
      if (HIDWORD(a4))
      {
        int64_t v16 = a4;
        v13 = &v16;
        CFNumberType v14 = kCFNumberLongLongType;
      }
      else
      {
        int v17 = a4;
        v13 = (int64_t *)&v17;
        CFNumberType v14 = kCFNumberIntType;
      }
      CFNumberRef v15 = CFNumberCreate(0, v14, v13);
    }
    else
    {
      CFNumberRef v15 = 0;
    }
    snapshot_set_object((char *)snapshot, v12 + a3, (uint64_t)v15);
  }
}

- (void)setOptLock:(int64_t)a3
{
  self->_snapshot->_cd_version = a3;
}

- (unint64_t)version
{
  if (self) {
    return *(unsigned int *)(*(void *)(self + 40) + 12);
  }
  return self;
}

- (void)setForeignOrderKeySlot:(unsigned int)a3 orderKey:(unsigned int)a4
{
  *(_DWORD *)((char *)&self->super.super.isa
            + 4 * a3
            + _NSSQLRowInstanceSize
            + ((2 * *(_DWORD *)&self->super._externalRefFlags) & 0x1FFF8)) = a4;
}

- (void)setForeignEntityKeySlot:(unsigned int)a3 entityKey:(unsigned int)a4
{
  *(_WORD *)((char *)&self->super.super.isa
           + 2 * a3
           + _NSSQLRowInstanceSize
           + ((2 * *(_DWORD *)&self->super._externalRefFlags) & 0x1FFF8)
           + (((unint64_t)self->super._externalRefFlags >> 14) & 0xFFFC)) = a4;
}

- (CFBitVectorRef)newColumnMaskFrom:(uint64_t)a3 columnInclusionOptions:
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    char v5 = *((unsigned char *)result + 16);
    CFBitVectorRef v114 = result;
    if (v5) {
      v6 = 0;
    }
    else {
      v6 = (void *)[*(id *)(*((void *)result + 5) + 16) _storeInfo1];
    }
    v7 = (void *)[v6 foreignKeyColumns];
    uint64_t v8 = (unsigned __int8 *)[v6 foreignEntityKeyColumns];
    unint64_t v9 = (void *)[v6 foreignOrderKeyColumns];
    id v115 = (id)[v6 attributeColumns];
    uint64_t v10 = [v115 count];
    id v113 = v9;
    uint64_t v11 = [v9 count];
    v112 = v8;
    uint64_t v12 = [v8 count];
    uint64_t v13 = [v7 count];
    v110 = &v107;
    CFIndex v109 = v11 + v10 + v12 + v13;
    MEMORY[0x1F4188790](v13);
    CFNumberRef v15 = (const UInt8 *)&v107 - v14;
    bzero((char *)&v107 - v14, v16);
    unint64_t v116 = a3;
    if ((a3 & 0xA) == 0)
    {
      unsigned int v27 = [v7 count];
      goto LABEL_23;
    }
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    uint64_t v17 = [v7 countByEnumeratingWithState:&v129 objects:v136 count:16];
    if (!v17)
    {
      unsigned int v27 = 0;
      if ((a3 & 2) != 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
    uint64_t v18 = v17;
    int v19 = 0;
    uint64_t v20 = *(void *)v130;
LABEL_8:
    uint64_t v21 = 0;
    int v22 = v19;
    while (1)
    {
      if (*(void *)v130 != v20) {
        objc_enumerationMutation(v7);
      }
      v23 = *(void **)(*((void *)&v129 + 1) + 8 * v21);
      if ((a3 & 2) == 0) {
        break;
      }
      unsigned int v25 = [v23 slot];
      a3 = -[NSSQLRow foreignKeyForSlot:]((uint64_t)v114, v25);
      BOOL v26 = a3 == -[NSSQLRow foreignKeyForSlot:](a2, v25);
      LOBYTE(a3) = v116;
      if (!v26) {
        goto LABEL_16;
      }
LABEL_17:
      if (v18 == ++v21)
      {
        uint64_t v18 = [v7 countByEnumeratingWithState:&v129 objects:v136 count:16];
        int v19 = v22 + v21;
        if (!v18)
        {
          unsigned int v27 = v22 + v21;
          if ((a3 & 2) != 0)
          {
LABEL_24:
            long long v127 = 0u;
            long long v128 = 0u;
            long long v125 = 0u;
            long long v126 = 0u;
            uint64_t v29 = [v112 countByEnumeratingWithState:&v125 objects:v135 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v126;
              do
              {
                uint64_t v32 = 0;
                unsigned int v33 = v27;
                uint64_t v34 = (uint64_t)v114;
                do
                {
                  if (*(void *)v126 != v31) {
                    objc_enumerationMutation(v112);
                  }
                  unsigned int v35 = [*(id *)(*((void *)&v125 + 1) + 8 * v32) slot];
                  if (a2) {
                    int v36 = *(unsigned __int16 *)(a2
                  }
                                              + _NSSQLRowInstanceSize
                                              + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8)
                                              + (((unint64_t)*(unsigned int *)(a2 + 16) >> 14) & 0xFFFC)
                                              + 2 * v35);
                  else {
                    int v36 = 0;
                  }
                  if (v36 != *(unsigned __int16 *)(v34
                                                  + _NSSQLRowInstanceSize
                                                  + ((2 * *(_DWORD *)(v34 + 16)) & 0x1FFF8)
                                                  + (((unint64_t)*(unsigned int *)(v34 + 16) >> 14) & 0xFFFC)
                                                  + 2 * v35))
                    v15[(v33 + v32) >> 3] |= 1 << (~(v33 + v32) & 7);
                  ++v32;
                }
                while (v30 != v32);
                uint64_t v37 = [v112 countByEnumeratingWithState:&v125 objects:v135 count:16];
                uint64_t v30 = v37;
                unsigned int v27 = v33 + v32;
              }
              while (v37);
              unsigned int v27 = v33 + v32;
            }
            long long v123 = 0u;
            long long v124 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            uint64_t v38 = [v113 countByEnumeratingWithState:&v121 objects:v134 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v122;
              do
              {
                uint64_t v41 = 0;
                unsigned int v42 = v27;
                uint64_t v43 = (uint64_t)v114;
                do
                {
                  if (*(void *)v122 != v40) {
                    objc_enumerationMutation(v113);
                  }
                  unsigned int v44 = [*(id *)(*((void *)&v121 + 1) + 8 * v41) slot];
                  if (a2) {
                    int v45 = *(_DWORD *)(a2 + _NSSQLRowInstanceSize + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8) + 4 * v44);
                  }
                  else {
                    int v45 = 0;
                  }
                  if (*(_DWORD *)(v43 + _NSSQLRowInstanceSize + ((2 * *(_DWORD *)(v43 + 16)) & 0x1FFF8) + 4 * v44) != v45) {
                    v15[(v42 + v41) >> 3] |= 1 << (~(v42 + v41) & 7);
                  }
                  ++v41;
                }
                while (v39 != v41);
                uint64_t v46 = [v113 countByEnumeratingWithState:&v121 objects:v134 count:16];
                uint64_t v39 = v46;
                unsigned int v27 = v42 + v41;
              }
              while (v46);
              unsigned int v27 = v42 + v41;
            }
LABEL_52:
            long long v119 = 0u;
            long long v120 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            uint64_t v47 = [v115 countByEnumeratingWithState:&v117 objects:v133 count:16];
            if (!v47) {
              return CFBitVectorCreate(0, v15, v109);
            }
            uint64_t v48 = v47;
            id v113 = (id)((v116 >> 4) & 1);
            uint64_t v49 = *(void *)v118;
            while (2)
            {
              uint64_t v50 = 0;
LABEL_55:
              if (*(void *)v118 != v49) {
                objc_enumerationMutation(v115);
              }
              v51 = *(_WORD **)(*((void *)&v117 + 1) + 8 * v50);
              if (!v51 || (v51[16] & 0x18) == 0)
              {
                int v52 = [v51 isConstrained];
                if ((v116 & 8) != 0) {
                  int v53 = v52 ^ 1;
                }
                else {
                  int v53 = 1;
                }
                if ((v53 | v113) != 1) {
                  goto LABEL_76;
                }
                char v54 = v52;
                if ((v116 & 0x10) == 0) {
                  LOBYTE(v53) = 1;
                }
                if (((v52 ^ 1) & (v116 >> 2) & 1) != 0 || (v53 & 1) == 0)
                {
                  unsigned int v55 = [v51 slot];
                  if (a2) {
                    char v56 = 0;
                  }
                  else {
                    char v56 = v54;
                  }
                  if (v56)
                  {
                    v15[(unint64_t)v27 >> 3] |= 1 << (~(_BYTE)v27 & 7);
                    goto LABEL_78;
                  }
                  unsigned int v57 = v55;
                  if (a2) {
                    v58 = *(unsigned __int8 **)(a2 + 40);
                  }
                  else {
                    v58 = 0;
                  }
                  v59 = (unsigned __int8 *)*((void *)v114 + 5);
                  int v60 = 1 << (v55 & 7);
                  if (((v60 & v59[((unint64_t)v55 >> 3) + 28]) != 0) != ((v60 & v58[((unint64_t)v55 >> 3) + 28]) != 0))
                  {
LABEL_76:
                    v15[(unint64_t)v27 >> 3] |= 1 << (~(_BYTE)v27 & 7);
                  }
                  else if ((v60 & v59[((unint64_t)v55 >> 3) + 28]) == 0)
                  {
                    uint64_t v111 = v55;
                    v112 = v58;
                    Class Class = object_getClass(v59);
                    int v62 = *(char *)(*((void *)object_getIndexedIvars(Class) + 7) + v57);
                    switch(v62)
                    {
                      case 'c':
                        Class v63 = object_getClass(v59);
                        IndexedIvars = (unsigned int *)object_getIndexedIvars(v63);
                        uint64_t v65 = v111;
                        v66 = v112;
                        int v67 = v59[IndexedIvars[v111 + 19]];
                        Class v68 = object_getClass(v112);
                        int v69 = v66[*((unsigned int *)object_getIndexedIvars(v68) + v65 + 19)];
                        goto LABEL_95;
                      case 'd':
                        Class v83 = object_getClass(v59);
                        v84 = (unsigned int *)object_getIndexedIvars(v83);
                        uint64_t v86 = v111;
                        v85 = (char *)v112;
                        double v87 = *(double *)&v59[v84[v111 + 19]];
                        Class v88 = object_getClass(v112);
                        if (v87 != *(double *)&v85[*((unsigned int *)object_getIndexedIvars(v88) + v86 + 19)]) {
                          goto LABEL_76;
                        }
                        break;
                      case 'e':
                      case 'g':
                      case 'h':
                        goto LABEL_86;
                      case 'f':
                        Class v89 = object_getClass(v59);
                        v90 = (unsigned int *)object_getIndexedIvars(v89);
                        uint64_t v92 = v111;
                        v91 = (char *)v112;
                        float v93 = *(float *)&v59[v90[v111 + 19]];
                        Class v94 = object_getClass(v112);
                        if (v93 != *(float *)&v91[*((unsigned int *)object_getIndexedIvars(v94) + v92 + 19)]) {
                          goto LABEL_76;
                        }
                        break;
                      case 'i':
                        Class v95 = object_getClass(v59);
                        v96 = (unsigned int *)object_getIndexedIvars(v95);
                        uint64_t v97 = v111;
                        v98 = (char *)v112;
                        int v67 = *(_DWORD *)&v59[v96[v111 + 19]];
                        Class v99 = object_getClass(v112);
                        int v69 = *(_DWORD *)&v98[*((unsigned int *)object_getIndexedIvars(v99) + v97 + 19)];
                        goto LABEL_95;
                      default:
                        if (v62 == 113)
                        {
                          Class v100 = object_getClass(v59);
                          v101 = (unsigned int *)object_getIndexedIvars(v100);
                          uint64_t v102 = v111;
                          v103 = (char *)v112;
                          uint64_t v104 = *(void *)&v59[v101[v111 + 19]];
                          Class v105 = object_getClass(v112);
                          if (v104 != *(void *)&v103[*((unsigned int *)object_getIndexedIvars(v105) + v102 + 19)]) {
                            goto LABEL_76;
                          }
                        }
                        else if (v62 == 115)
                        {
                          Class v70 = object_getClass(v59);
                          v71 = (unsigned int *)object_getIndexedIvars(v70);
                          uint64_t v72 = v111;
                          v73 = (char *)v112;
                          int v67 = *(unsigned __int16 *)&v59[v71[v111 + 19]];
                          Class v74 = object_getClass(v112);
                          int v69 = *(unsigned __int16 *)&v73[*((unsigned int *)object_getIndexedIvars(v74) + v72 + 19)];
LABEL_95:
                          if (v67 != v69) {
                            goto LABEL_76;
                          }
                        }
                        else
                        {
LABEL_86:
                          Class v75 = object_getClass(v59);
                          v76 = (unsigned int *)object_getIndexedIvars(v75);
                          uint64_t v77 = v111;
                          v108 = *(void **)&v59[v76[v111 + 19]];
                          v78 = (char *)v112;
                          Class v79 = object_getClass(v112);
                          v80 = *(void **)&v78[*((unsigned int *)object_getIndexedIvars(v79) + v77 + 19)];
                          if ([v51 sqlType] == 16)
                          {
                            v81 = v108;
                            if (v108 == v80) {
                              break;
                            }
                            if (![v51 isFileBackedFuture]) {
                              goto LABEL_76;
                            }
                            v82 = v81;
                          }
                          else
                          {
                            v82 = v108;
                            if (v108 == v80) {
                              break;
                            }
                          }
                          if (([v82 isEqual:v80] & 1) == 0) {
                            goto LABEL_76;
                          }
                        }
                        break;
                    }
                  }
                }
              }
              ++v27;
LABEL_78:
              if (v48 == ++v50)
              {
                uint64_t v106 = [v115 countByEnumeratingWithState:&v117 objects:v133 count:16];
                uint64_t v48 = v106;
                if (!v106) {
                  return CFBitVectorCreate(0, v15, v109);
                }
                continue;
              }
              goto LABEL_55;
            }
          }
LABEL_23:
          int v28 = [v112 count];
          v27 += v28 + [v113 count];
          goto LABEL_52;
        }
        goto LABEL_8;
      }
    }
    int v24 = objc_msgSend((id)objc_msgSend(v23, "toOneRelationship"), "isConstrained");
    if ((a3 & 8) == 0 || !v24) {
      goto LABEL_17;
    }
LABEL_16:
    v15[(v22 + v21) >> 3] |= 1 << (~(v22 + v21) & 7);
    goto LABEL_17;
  }
  return result;
}

- (uint64_t)_validateToOnes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 16) & 1) == 0)
    {
      unsigned __int8 v2 = (void *)[*(id *)(*(void *)(result + 40) + 16) _storeInfo1];
      v3 = (void *)[v2 foreignKeyColumns];
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      result = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (result)
      {
        uint64_t v4 = result;
        uint64_t v5 = *(void *)v12;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v12 != v5) {
              objc_enumerationMutation(v3);
            }
            v7 = (unsigned char *)[*(id *)(*((void *)&v11 + 1) + 8 * v6) toOneRelationship];
            uint64_t v8 = v7;
            if (!v7 || !v7[88])
            {
              int v9 = [v7 slot];
              if (v2) {
                uint64_t v10 = v2[24];
              }
              else {
                LODWORD(v10) = 0;
              }
              snapshot_set_object(*(char **)(v1 + 40), v9 + v10, [(id)v1 newObjectIDForToOne:v8]);
            }
            ++v6;
          }
          while (v4 != v6);
          result = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
          uint64_t v4 = result;
        }
        while (result);
      }
      atomic_store(0, (unsigned __int8 *)(v1 + 20));
    }
  }
  return result;
}

- (id)newObjectIDForToOne:(id)a3
{
  cd_objectID = self->_snapshot->_cd_objectID;
  id result = (id)-[NSSQLRow foreignKeyForSlot:]((uint64_t)self, [*((id *)a3 + 8) slot]);
  if (result)
  {
    id v7 = result;
    uint64_t v8 = [(NSManagedObjectID *)cd_objectID persistentStore];
    int v9 = (void *)*((void *)a3 + 9);
    if (v9) {
      _sqlEntityForEntityID(*(void *)(-[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1") + 16), *(unsigned __int16 *)((char *)&self->super.super.isa+ 2 * [v9 slot]+ _NSSQLRowInstanceSize+ ((2 * *(_DWORD *)&self->super._externalRefFlags) & 0x1FFF8)+ (((unint64_t)self->super._externalRefFlags >> 14) & 0xFFFC)));
    }
    return (id)-[NSSQLCore newForeignKeyID:entity:](v8, (uint64_t)v7);
  }
  return result;
}

- (uint64_t)foreignKeyForSlot:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)([*(id *)(*(void *)(result + 40) + 16) entity] + 112);
    unint64_t v5 = *(void *)(v4 + 104);
    BOOL v6 = a2 >= v5;
    unint64_t v7 = a2 - v5;
    if (v6)
    {
      return *(void *)(v3 + _NSSQLRowInstanceSize + 8 * v7);
    }
    else
    {
      uint64_t v8 = *(char **)(v3 + 40);
      unsigned int v9 = *(_DWORD *)(v4 + 96) + a2;
      Class Class = object_getClass(v8);
      long long v11 = *(void **)&v8[*((unsigned int *)object_getIndexedIvars(Class) + v9 + 19)];
      if (v11)
      {
        if ([v11 isNSNumber])
        {
          return [v11 longLongValue];
        }
        else
        {
          return [v11 _referenceData64];
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (id)copy
{
  if (!self || (*(unsigned char *)&self->super._externalRefFlags & 1) != 0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (void *)[(NSManagedObjectID *)self->_snapshot->_cd_objectID _storeInfo1];
  }
  uint64_t v4 = objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, v3), "initWithSQLEntity:objectID:", v3, -[NSSQLRow objectID](self, "objectID"));
  unint64_t v5 = *(void **)(v4 + 40);
  BOOL v6 = [(_CDSnapshot *)self->_snapshot mutableCopy];
  *(void *)(v4 + 40) = v6;
  v6[24] |= 1u;
  if (v5 != *(void **)(v4 + 40)) {

  }
  uint64_t v7 = [(id)-[NSSQLEntity virtualForeignKeyColumns]((unint64_t)v3) count];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v3, "foreignEntityKeyColumns"), "count");
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v3, "foreignOrderKeyColumns"), "count");
  if (v8 + v7 + v9) {
    memcpy((void *)(v4 + _NSSQLRowInstanceSize), (char *)self + _NSSQLRowInstanceSize, 2 * v8 + 8 * v7 + 4 * v9);
  }
  *(_externalRefFlags_st *)(v4 + 16) = self->super._externalRefFlags;
  *(double *)(v4 + 32) = self->super._birth;
  -[NSPersistentCacheRow copyRelationshipCachesFrom:]((void *)v4, (uint64_t)self);
  return (id)v4;
}

+ (void)allocForSQLEntity:(uint64_t)a1
{
  uint64_t v3 = (objc_class *)self;
  int v4 = [(id)-[NSSQLEntity virtualForeignKeyColumns]((unint64_t)a2) count];
  int v5 = objc_msgSend((id)objc_msgSend(a2, "foreignEntityKeyColumns"), "count");
  uint64_t v6 = 2 * v5 + 8 * v4 + 4 * objc_msgSend((id)objc_msgSend(a2, "foreignOrderKeyColumns"), "count");

  return _PFAllocateObject(v3, v6);
}

- (NSSQLRow)initWithSQLEntity:(id)a3 ownedObjectID:(id)a4 andTimestamp:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)NSSQLRow;
  id v7 = [(NSPersistentCacheRow *)&v10 initWithOptions:0 andTimestamp:a5];
  if (v7)
  {
    uint64_t v8 = objc_alloc_init((Class)_PFCDSnapshotClassForEntity([a3 entityDescription]));
    *((void *)v7 + 5) = v8;
    v8[2] = a4;
    snapshot_set_transient_default_values(*((void *)v7 + 5));
    *(unsigned char *)(*((void *)v7 + 5) + 24) |= 1u;
    atomic_store(0, (unsigned __int8 *)v7 + 20);
    *((_DWORD *)v7 + 4) = *((_DWORD *)v7 + 4) & 0xFFFFFFFE | [a4 isTemporaryID];
    *((_DWORD *)v7 + 4) = *((_DWORD *)v7 + 4) & 0xFFFF0003 | (4
                                                            * ([(id)-[NSSQLEntity virtualForeignKeyColumns]((unint64_t)a3) count] & 0x3FFF));
    *((_DWORD *)v7 + 4) = *((_DWORD *)v7 + 4) & 0xC000FFFF | ((objc_msgSend((id)objc_msgSend(a3, "foreignOrderKeyColumns"), "count") & 0x3FFF) << 16);
  }
  return (NSSQLRow *)v7;
}

+ (unsigned)newBatchRowAllocation:(id *)a3 count:(unsigned int)a4 forSQLEntity:(id)a5 withOwnedObjectIDs:(id *)a6 andTimestamp:(double)a7
{
  uint64_t v10 = *(void *)&a4;
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = [(id)-[NSSQLEntity virtualForeignKeyColumns]((unint64_t)a5) count];
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a5, "foreignEntityKeyColumns"), "count");
  uint64_t v15 = objc_msgSend((id)objc_msgSend(a5, "foreignOrderKeyColumns"), "count");
  uint64_t v16 = (void *)_PFCDSnapshotClassForEntity([a5 entityDescription]);
  MEMORY[0x1F4188790](v16);
  int v19 = (void **)((char *)v29 - v18);
  if (v10 > 0x200) {
    int v19 = (void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v29 - v18, 8 * v17);
  }
  unsigned int v20 = [v16 newBatchAllocation:v19 count:v10 withOwnedObjectIDs:a6];
  if (v20 >= v10)
  {
    unsigned int v22 = _PFAllocateObjects((objc_class *)a1, a3, v10, 2 * v14 + 8 * v13 + 4 * v15);
    unsigned int v21 = v22;
    if (v22)
    {
      uint64_t v23 = v22;
      int v24 = (uint64_t *)v19;
      do
      {
        uint64_t v26 = (uint64_t)*a3++;
        uint64_t v25 = v26;
        uint64_t v27 = *v24++;
        *(void *)(v25 + 40) = v27;
        snapshot_set_transient_default_values(v27);
        *(unsigned char *)(v27 + 24) |= 1u;
        *(double *)(v25 + 32) = a7;
        *(_DWORD *)(v25 + 16) = (unsigned __int16)(4 * (v13 & 0x3FFF)) | ((v15 & 0x3FFF) << 16) | *(_DWORD *)(v25 + 16) & 0xC0000003;
        --v23;
      }
      while (v23);
    }
  }
  else
  {
    _PFDeallocateObjects(v19, v20);
    unsigned int v21 = 0;
  }
  if (v10 >= 0x201) {
    NSZoneFree(0, v19);
  }
  return v21;
}

- (NSSQLRow)initWithSQLEntity:(id)a3 objectID:(id)a4
{
  id v6 = a4;
  double Current = CFAbsoluteTimeGetCurrent();

  return [(NSSQLRow *)self initWithSQLEntity:a3 ownedObjectID:v6 andTimestamp:Current];
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)_snapshot_
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->super._invalidToOnes);
  if (v3) {
    -[NSSQLRow _validateToOnes]((uint64_t)self);
  }
  return self->_snapshot;
}

- (id)objectID
{
  return self->_snapshot->_cd_objectID;
}

- (unsigned)_versionNumber
{
  return self->_snapshot->_cd_version;
}

- (id)valueForKey:(id)a3
{
  if (!self || (*(unsigned char *)&self->super._externalRefFlags & 1) != 0)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v5 = [(NSManagedObjectID *)self->_snapshot->_cd_objectID _storeInfo1];
    id v6 = (_DWORD *)v5;
    if (v5)
    {
      id v7 = (unsigned __int8 *)[*(id *)(v5 + 40) objectForKey:a3];
      if (v7)
      {
        uint64_t v8 = v7;
        int v9 = v7[24];
        if (v9 != 7)
        {
          if (v9 == 1)
          {
            unsigned int v10 = [v7 slot];
            return -[NSSQLRow attributeValueForSlot:]((CFDateRef)self, v10);
          }
          if ([v7 propertyType] != 3) {
            objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"unexpected key found for: %@", v8), 0 reason userInfo]);
          }
        }
        unsigned __int8 v16 = atomic_load((unsigned __int8 *)&self->super._invalidToOnes);
        if (v16) {
          -[NSSQLRow _validateToOnes]((uint64_t)self);
        }
        snapshot = self->_snapshot;
        unsigned int v15 = [v8 slot] + v6[48];
LABEL_23:
        Class Class = object_getClass(snapshot);
        return *(Class *)((char *)&snapshot->super.isa + *((unsigned int *)object_getIndexedIvars(Class) + v15 + 19));
      }
    }
  }
  if (a3 != @"objectID" && ![@"objectID" isEqualToString:a3])
  {
    long long v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "entityDescription"), "propertiesByName"), "objectForKey:", a3);
    if ([v12 _propertyType] != 7)
    {
      v18.receiver = self;
      v18.super_class = (Class)NSSQLRow;
      return [(NSSQLRow *)&v18 valueForKey:a3];
    }
    uint64_t v13 = objc_msgSend((id)-[NSSQLEntity sqlAttributesForCompositeAttributeName:]((uint64_t)v6, objc_msgSend(v12, "name")), "firstObject");
    snapshot = self->_snapshot;
    unsigned int v15 = [v13 slot];
    goto LABEL_23;
  }

  return [(NSSQLRow *)self objectID];
}

- (CFDateRef)attributeValueForSlot:(CFDateRef)result
{
  if (result)
  {
    CFDateRef v3 = result;
    int v4 = (unsigned __int8 *)*((void *)result + 5);
    uint64_t v5 = a2;
    if ((v4[((unint64_t)a2 >> 3) + 28] >> (a2 & 7)))
    {
      return 0;
    }
    else
    {
      Class Class = object_getClass(v4);
      int v7 = *(char *)(*((void *)object_getIndexedIvars(Class) + 7) + a2);
      int v28 = 0;
      switch(v7)
      {
        case 'c':
          uint64_t v8 = (char *)*((void *)v3 + 5);
          Class v9 = object_getClass(v8);
          int v10 = v8[*((unsigned int *)object_getIndexedIvars(v9) + v5 + 19)];
          goto LABEL_11;
        case 'd':
          int v19 = (char *)*((void *)v3 + 5);
          Class v20 = object_getClass(v19);
          CFAbsoluteTime v21 = *(double *)&v19[*((unsigned int *)object_getIndexedIvars(v20) + v5 + 19)];
          if (objc_msgSend(*(id *)(*(void *)(objc_msgSend(*(id *)(*((void *)v3 + 5) + 16), "entity", *(void *)&v21) + 96)+ 24+ 8 * v5), "attributeType") == 900)
          {
            CFDateRef v22 = CFDateCreate(0, v21);
            goto LABEL_18;
          }
          unsigned int v17 = &v27;
          CFNumberType v18 = kCFNumberDoubleType;
          goto LABEL_17;
        case 'e':
        case 'g':
        case 'h':
          goto LABEL_9;
        case 'f':
          uint64_t v23 = (char *)*((void *)v3 + 5);
          Class v24 = object_getClass(v23);
          LODWORD(v27) = *(_DWORD *)&v23[*((unsigned int *)object_getIndexedIvars(v24) + v5 + 19)];
          unsigned int v17 = &v27;
          CFNumberType v18 = kCFNumberFloatType;
          goto LABEL_17;
        case 'i':
          unsigned int v15 = (char *)*((void *)v3 + 5);
          Class v16 = object_getClass(v15);
          int v10 = *(_DWORD *)&v15[*((unsigned int *)object_getIndexedIvars(v16) + v5 + 19)];
          goto LABEL_11;
        default:
          if (v7 == 113)
          {
            uint64_t v25 = (char *)*((void *)v3 + 5);
            Class v26 = object_getClass(v25);
            uint64_t v27 = *(void *)&v25[*((unsigned int *)object_getIndexedIvars(v26) + v5 + 19)];
            unsigned int v17 = &v27;
            CFNumberType v18 = kCFNumberLongLongType;
          }
          else
          {
            if (v7 != 115)
            {
LABEL_9:
              uint64_t v13 = (char *)*((void *)v3 + 5);
              Class v14 = object_getClass(v13);
              return *(CFDateRef *)&v13[*((unsigned int *)object_getIndexedIvars(v14) + v5 + 19)];
            }
            long long v11 = (char *)*((void *)v3 + 5);
            Class v12 = object_getClass(v11);
            int v10 = *(__int16 *)&v11[*((unsigned int *)object_getIndexedIvars(v12) + v5 + 19)];
LABEL_11:
            int v28 = v10;
            unsigned int v17 = (uint64_t *)&v28;
            CFNumberType v18 = kCFNumberIntType;
          }
LABEL_17:
          CFDateRef v22 = CFNumberCreate(0, v18, v17);
LABEL_18:
          id result = v22;
          break;
      }
    }
  }
  return result;
}

- (BOOL)hasUniqueConstraintDiffFrom:(const __CFBitVector *)a1
{
  if (!a1) {
    return 0;
  }
  CFBitVectorRef v2 = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:](a1, a2, 24);
  if (!v2) {
    return 0;
  }
  CFBitVectorRef v3 = v2;
  v6.length = CFBitVectorGetCount(v2);
  v6.location = 0;
  BOOL v4 = CFBitVectorContainsBit(v3, v6, 1u) != 0;
  CFRelease(v3);
  return v4;
}

- (void)setObjectID:(id)a3
{
  self->super._externalRefFlags = (_externalRefFlags_st)(*(_DWORD *)&self->super._externalRefFlags & 0xFFFFFFFE | [a3 isTemporaryID]);
}

+ (void)initialize
{
  _NSSQLRowInstanceSize = (class_getInstanceSize((Class)a1) + 7) & 0xFFFFFFFFFFFFFFF8;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)description
{
  if (!self || (*(unsigned char *)&self->super._externalRefFlags & 1) != 0) {
    CFBitVectorRef v3 = 0;
  }
  else {
    CFBitVectorRef v3 = (void *)[(NSManagedObjectID *)self->_snapshot->_cd_objectID _storeInfo1];
  }
  BOOL v4 = (void *)MEMORY[0x1E4F28E78];
  v45.receiver = self;
  v45.super_class = (Class)NSSQLRow;
  id v5 = [(NSSQLRow *)&v45 description];
  uint64_t v6 = [v3 name];
  unsigned int v44 = v3;
  if (self)
  {
    uint64_t v7 = [(NSManagedObjectID *)self->_snapshot->_cd_objectID _storeInfo1];
    if (v7) {
      uint64_t v8 = *(unsigned int *)(v7 + 184);
    }
    else {
      uint64_t v8 = 0;
    }
    int64_t v9 = [(NSManagedObjectID *)self->_snapshot->_cd_objectID _referenceData64];
    uint64_t cd_version = self->_snapshot->_cd_version;
  }
  else
  {
    uint64_t v8 = 0;
    int64_t v9 = 0;
    uint64_t cd_version = 0;
  }
  long long v11 = (void *)[v4 stringWithFormat:@"%@{%@ %d-%qd-%qi", v5, v6, v8, v9, cd_version];
  Class v12 = (void *)[v44 attributeColumns];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t i = 0; i != v14; ++i)
    {
      Class v16 = (void *)[v12 objectAtIndex:i];
      uint64_t v17 = [v16 name];
      CFNumberType v18 = (void *)[v16 propertyDescription];
      if (v18 && [v18 superCompositeAttribute]) {
        uint64_t v17 = objc_msgSend((id)objc_msgSend(v16, "propertyDescription"), "_qualifiedName");
      }
      uint64_t v19 = [(_CDSnapshot *)self->_snapshot valueForKeyPath:v17];
      if (v19)
      {
        Class v20 = (void *)v19;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 appendFormat:@" %@=<NSFileBackedFuture fileSize=%lu>", v17, objc_msgSend(v20, "fileSize")];
          }
          else {
            [v11 appendFormat:@" %@=<NSData len=%lu>", v17, objc_msgSend(v20, "length")];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 appendFormat:@" %@=\"%@\"", v17, v20];
          }
          else {
            [v11 appendFormat:@" %@=%@", v17, objc_msgSend(v20, "description")];
          }
        }
      }
      else
      {
        [v11 appendFormat:@" %@=NULL", v17, v43];
      }
    }
  }
  CFAbsoluteTime v21 = (void *)[v44 foreignKeyColumns];
  uint64_t v22 = [v21 count];
  if (v22)
  {
    uint64_t v23 = v22;
    for (uint64_t j = 0; j != v23; ++j)
    {
      uint64_t v25 = (void *)[v21 objectAtIndex:j];
      [v11 appendFormat:@" %@=%qd", objc_msgSend(v25, "name"), -[NSSQLRow foreignKeyForSlot:]((uint64_t)self, objc_msgSend(v25, "slot"))];
    }
  }
  Class v26 = (void *)[v44 foreignEntityKeyColumns];
  uint64_t v27 = [v26 count];
  if (v27)
  {
    uint64_t v28 = v27;
    for (uint64_t k = 0; k != v28; ++k)
    {
      uint64_t v30 = (void *)[v26 objectAtIndex:k];
      uint64_t v31 = [v30 name];
      unsigned int v32 = [v30 slot];
      if (self) {
        uint64_t v33 = *(unsigned __int16 *)((char *)&self->super.super.isa
      }
                                  + 2 * v32
                                  + _NSSQLRowInstanceSize
                                  + ((2 * *(_DWORD *)&self->super._externalRefFlags) & 0x1FFF8)
                                  + (((unint64_t)self->super._externalRefFlags >> 14) & 0xFFFC));
      else {
        uint64_t v33 = 0;
      }
      [v11 appendFormat:@" %@=%u", v31, v33];
    }
  }
  uint64_t v34 = (void *)[v44 foreignOrderKeyColumns];
  uint64_t v35 = [v34 count];
  if (v35)
  {
    uint64_t v36 = v35;
    for (uint64_t m = 0; m != v36; ++m)
    {
      uint64_t v38 = (void *)[v34 objectAtIndex:m];
      uint64_t v39 = [v38 name];
      unsigned int v40 = [v38 slot];
      if (self) {
        uint64_t v41 = *(unsigned int *)((char *)&self->super.super.isa
      }
                              + 4 * v40
                              + _NSSQLRowInstanceSize
                              + ((2 * *(_DWORD *)&self->super._externalRefFlags) & 0x1FFF8));
      else {
        uint64_t v41 = 0;
      }
      [v11 appendFormat:@" %@=%u", v39, v41];
    }
  }
  objc_msgSend(v11, "appendFormat:", @" and to-manys=%p}", self->super._toManyMap);
  return v11;
}

@end