@interface GAXSpringboardClientStatus
- (NSData)archivedSessionApplicationIcon;
- (NSString)sessionApplicationName;
- (id)description;
- (void)setArchivedSessionApplicationIcon:(id)a3;
- (void)setSessionApplicationName:(id)a3;
@end

@implementation GAXSpringboardClientStatus

- (id)description
{
  v3 = [(GAXSpringboardClientStatus *)self sessionApplicationName];
  v4 = [(GAXSpringboardClientStatus *)self archivedSessionApplicationIcon];
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 length] != 0);
  v6 = +[NSString stringWithFormat:@"GAXSpringboardClientStatus<%p>. appName:%@. hasIconData:%@", self, v3, v5];

  return v6;
}

- (NSString)sessionApplicationName
{
  return self->_sessionApplicationName;
}

- (void)setSessionApplicationName:(id)a3
{
}

- (NSData)archivedSessionApplicationIcon
{
  return self->_archivedSessionApplicationIcon;
}

- (void)setArchivedSessionApplicationIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedSessionApplicationIcon, 0);

  objc_storeStrong((id *)&self->_sessionApplicationName, 0);
}

@end