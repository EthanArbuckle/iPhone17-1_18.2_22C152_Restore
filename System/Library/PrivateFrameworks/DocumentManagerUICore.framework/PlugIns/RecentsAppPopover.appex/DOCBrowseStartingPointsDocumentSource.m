@interface DOCBrowseStartingPointsDocumentSource
- (_TtC17RecentsAppPopover37DOCBrowseStartingPointsDocumentSource)init;
- (_TtC17RecentsAppPopover37DOCBrowseStartingPointsDocumentSource)initWithCoder:(id)a3;
@end

@implementation DOCBrowseStartingPointsDocumentSource

- (_TtC17RecentsAppPopover37DOCBrowseStartingPointsDocumentSource)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCBrowseStartingPointsDocumentSource();
  return [(DOCBrowseStartingPointsDocumentSource *)&v5 initWithCoder:a3];
}

- (_TtC17RecentsAppPopover37DOCBrowseStartingPointsDocumentSource)init
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCBrowseStartingPointsDocumentSource();
  v2 = [(DOCBrowseStartingPointsDocumentSource *)&v4 init];
  [(DOCBrowseStartingPointsDocumentSource *)v2 setIdentifier:DOCDocumentSourceIdentifierBrowseStartingPoints];
  return v2;
}

@end