@interface FPDMoveAtom
+ (id)atomForMoving:(id)a3 toTargetFolder:(id)a4 as:(id)a5 root:(id)a6 atomically:(BOOL)a7 sourceMaterializeOption:(unint64_t)a8 targetMaterializeOption:(unint64_t)a9 useDiskWriter:(BOOL)a10;
+ (id)atomForPostFolderUnderRoot:(id)a3 atomically:(BOOL)a4 useDiskWriter:(BOOL)a5;
- (BOOL)shouldAccountForDownloadOfSourceItemForMoveInfo:(id)a3 extensionManager:(id)a4;
- (BOOL)useAtomicMove;
- (BOOL)useDiskWriter;
- (FPActionOperationLocator)root;
- (FPActionOperationLocator)source;
- (FPActionOperationLocator)targetFolder;
- (FPDMoveAtom)initWithKind:(unsigned __int8)a3 source:(id)a4 targetName:(id)a5 targetFolder:(id)a6 root:(id)a7 atomically:(BOOL)a8 sourceMaterializeOption:(unint64_t)a9 targetMaterializeOption:(unint64_t)a10 useDiskWriter:(BOOL)a11;
- (NSString)targetName;
- (id)description;
- (unint64_t)materializeOption;
- (unint64_t)targetMaterializeOption;
- (unsigned)kind;
@end

@implementation FPDMoveAtom

- (FPDMoveAtom)initWithKind:(unsigned __int8)a3 source:(id)a4 targetName:(id)a5 targetFolder:(id)a6 root:(id)a7 atomically:(BOOL)a8 sourceMaterializeOption:(unint64_t)a9 targetMaterializeOption:(unint64_t)a10 useDiskWriter:(BOOL)a11
{
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  v27.receiver = self;
  v27.super_class = (Class)FPDMoveAtom;
  v22 = [(FPDMoveAtom *)&v27 init];
  v23 = v22;
  if (v22)
  {
    v22->_kind = a3;
    objc_storeStrong((id *)&v22->_source, a4);
    uint64_t v24 = objc_msgSend(v19, "fp_filenameFromDisplayNameWithExtension:", 0);
    targetName = v23->_targetName;
    v23->_targetName = (NSString *)v24;

    objc_storeStrong((id *)&v23->_targetFolder, a6);
    objc_storeStrong((id *)&v23->_root, a7);
    v23->_useAtomicMove = a8;
    v23->_useDiskWriter = a11;
    v23->_materializeOption = a9;
    v23->_targetMaterializeOption = a10;
  }

  return v23;
}

+ (id)atomForMoving:(id)a3 toTargetFolder:(id)a4 as:(id)a5 root:(id)a6 atomically:(BOOL)a7 sourceMaterializeOption:(unint64_t)a8 targetMaterializeOption:(unint64_t)a9 useDiskWriter:(BOOL)a10
{
  BOOL v11 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  int v19 = [v18 isFolder];
  id v20 = [FPDMoveAtom alloc];
  LOBYTE(v24) = a10;
  if (v19) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = 2;
  }
  v22 = [(FPDMoveAtom *)v20 initWithKind:v21 source:v18 targetName:v16 targetFolder:v17 root:v15 atomically:v11 sourceMaterializeOption:a8 targetMaterializeOption:a9 useDiskWriter:v24];

  return v22;
}

+ (id)atomForPostFolderUnderRoot:(id)a3 atomically:(BOOL)a4 useDiskWriter:(BOOL)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  LOBYTE(v10) = a5;
  v8 = [[FPDMoveAtom alloc] initWithKind:1 source:0 targetName:0 targetFolder:0 root:v7 atomically:v6 sourceMaterializeOption:0 targetMaterializeOption:0 useDiskWriter:v10];

  return v8;
}

- (BOOL)shouldAccountForDownloadOfSourceItemForMoveInfo:(id)a3 extensionManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FPDMoveAtom *)self kind] == 2)
  {
    v8 = [(FPDMoveAtom *)self source];
    v9 = [v6 targetFolder];
    uint64_t v10 = objc_msgSend(v8, "materializeOptionForDestinationItem:recursively:isCopy:extensionManager:", v9, 0, objc_msgSend(v6, "byCopy"), v7);

    BOOL v11 = v10 == 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  if (self->_kind == 2)
  {
    v2 = @"<item-atom %@ -> %@ as %@; useDiskWriter %@>";
    goto LABEL_5;
  }
  if (!self->_kind)
  {
    v2 = @"<folder-atom %@ -> %@ as %@; useDiskWriter %@>";
LABEL_5:
    if (self->_useDiskWriter) {
      v3 = @"yes";
    }
    else {
      v3 = @"no";
    }
    objc_msgSend(NSString, "stringWithFormat:", v2, self->_source, self->_targetFolder, self->_targetName, v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v4 = @"<post-folder-atom>";
LABEL_10:
  return v4;
}

- (unsigned)kind
{
  return self->_kind;
}

- (FPActionOperationLocator)root
{
  return self->_root;
}

- (FPActionOperationLocator)source
{
  return self->_source;
}

- (NSString)targetName
{
  return self->_targetName;
}

- (FPActionOperationLocator)targetFolder
{
  return self->_targetFolder;
}

- (BOOL)useAtomicMove
{
  return self->_useAtomicMove;
}

- (BOOL)useDiskWriter
{
  return self->_useDiskWriter;
}

- (unint64_t)materializeOption
{
  return self->_materializeOption;
}

- (unint64_t)targetMaterializeOption
{
  return self->_targetMaterializeOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetFolder, 0);
  objc_storeStrong((id *)&self->_targetName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

@end