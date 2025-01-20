@interface MSSSharedLibraryInvitationCell
- (MSSSharedLibraryInvitationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)detailTextLabel;
- (id)imageView;
- (id)textLabel;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation MSSSharedLibraryInvitationCell

- (void).cxx_destruct
{
}

- (id)detailTextLabel
{
  return [(PXSharedLibraryInvitationContentView *)self->_invitationContentView titleLabel];
}

- (id)textLabel
{
  return [(PXSharedLibraryInvitationContentView *)self->_invitationContentView textLabel];
}

- (id)imageView
{
  return [(PXSharedLibraryInvitationContentView *)self->_invitationContentView imageView];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  [(MSSSharedLibraryInvitationCell *)self setSpecifier:v4];
  v8 = [v4 userInfo];

  id v5 = [v8 conformsToProtocol:&OBJC_PROTOCOL___PXSharedLibraryParticipant];
  v6 = v8;
  if (v5) {
    BOOL v7 = v8 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v5 = [(PXSharedLibraryInvitationContentView *)self->_invitationContentView setOwner:v8];
    v6 = v8;
  }

  _objc_release_x1(v5, v6);
}

- (MSSSharedLibraryInvitationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MSSSharedLibraryInvitationCell;
  id v5 = [(MSSSharedLibraryInvitationCell *)&v10 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = (PXSharedLibraryInvitationContentView *)objc_alloc_init((Class)PXSharedLibraryInvitationContentView);
    invitationContentView = v5->_invitationContentView;
    v5->_invitationContentView = v6;

    v8 = [(MSSSharedLibraryInvitationCell *)v5 contentView];
    objc_msgSend(v8, "px_addFullBoundsSubview:", v5->_invitationContentView);

    [(MSSSharedLibraryInvitationCell *)v5 setAccessoryType:1];
  }
  return v5;
}

@end